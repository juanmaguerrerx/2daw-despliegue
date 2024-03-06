#!/bin/bash
# Función para obtener un nombre de usuario único
get_unique_user() {
    local usrname
    read -rp "Por favor, ingrese un nombre de usuario:" usrname
    while id "${usrname}" &>/dev/null; do
        read -rp "El usuario ${usrname} ya existe. Por favor, ingrese otro:" usrname
    done
    echo "${usrname}"
}

# Función para obtener un nombre de sitio web único
get_unique_site() {
    local sitename
    read -rp "Por favor, ingrese un nombre para el sitio web:" sitename
    while [ -d "/var/www/${sitename}" ]; do
        read -rp "El directorio para /var/www/${sitename} ya existe. Por favor, ingrese otro nombre:"  sitename
    done
    echo "${sitename}"
}

# Función para crear usuario y directorio del sitio web
create_user_and_site() {
    local usrname=${1}
    local sitename=${2}

    sudo useradd "${usrname}"
    sudo mkdir /var/www/"${sitename}"
    sudo chown "${usrname}":"${usrname}" /var/www/"${sitename}"
    sudo chmod 755 /var/www/"${sitename}"
    echo "<html><body><h1>Bienvenido a ${sitename}!</h1></body></html>" | sudo tee /var/www/"${sitename}"/index.html > /dev/null
    echo "Usuario ${usrname} creado. Directorio de alojamiento web: /var/www/${sitename}"
}

# Función para crear la configuración del host virtual
create_virtual_host_config() {
    local usrname=$1
    local sitename=$2

    local sitename_error="${sitename}_error"
    local sitename_access="${sitename}_access"

    local temp_conf="/tmp/$sitename.conf"

    printf "Creando y configurando archivo de Host Virtual"
    echo "<VirtualHost *:80>
        ServerAdmin admin@example.com
        ServerName ${sitename}.com
        ServerAlias www.${sitename}.com
        DocumentRoot /var/www/${sitename}
        ErrorLog ${APACHE_LOG_DIR}/${sitename_error}.log
        CustomLog ${APACHE_LOG_DIR}/${sitename_access}.log combined
    </VirtualHost>" > "${temp_conf}"

    printf "Moviendo configuración a Apache sites-available \n"
    sudo mv "${temp_conf}" /etc/apache2/sites-available/"${sitename}".conf

    echo "Configuración del Host Virtual para ${sitename} creada en /etc/apache2/sites-available/${sitename}.conf"
}

# Función para crear usuario y base de datos MySQL
create_mysql_user_and_database() {
    local usrname=${1}
    local sitename=${2}
    local dbname="${sitename}_db"
    local passwordroot

    read -rp "Por favor, ingrese la contraseña del root: " passwordroot

    printf "Creando Base de Datos y Usuario MySQL\n"

    printf "Creando base de datos y usuario...\n"

    read -rp "Ingrese una contraseña para el usuario '$usrname' de MySQL: " password

     mysql -u root -p"${passwordroot}" <<EOF
    # Verificar si la base de datos ya existe
    SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '${dbname}';
EOF

    exists=$(mysql -u root -p"${passwordroot}" --skip-column-names -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '${dbname}'")

    if [ -n "$exists" ]; then
        echo "La base de datos '${dbname}' ya existe."
    else
        mysql -u root -p"${passwordroot}" <<EOF
        CREATE DATABASE ${dbname};
        CREATE USER '${usrname}'@'localhost' IDENTIFIED BY '${password}';
        GRANT ALL PRIVILEGES ON ${dbname}.* TO '${usrname}'@'localhost';
        FLUSH PRIVILEGES;
EOF
        echo "Base de datos '${dbname}' y usuario '${usrname}' creados."
    fi
}

# Función para configurar DNS
config_dns() {
    local sitename="${1}"
    local ip="${2}"

    printf "Añadiendo zona al archivo named.conf.local...\n"
    echo "zone \"${sitename}\" {
        type master;
        file \"/etc/bind/db.${sitename}\";
    };" | sudo tee -a /etc/bind/named.conf.local > /dev/null

    printf "Creando archivo de zona /etc/bind/db.%s...\n" "${sitename}"
    sudo cp /etc/bind/db.empty /etc/bind/db."${sitename}"
    sudo chown bind:bind /etc/bind/db."${sitename}"

    echo "\$TTL 86400
@       IN      SOA     ${sitename}.      admin.${sitename}. (
                    2023021801      ; serial
                    3600            ; refresh
                    1800            ; retry
                    604800          ; expire
                    86400 )         ; minimum

    IN      NS      ${sitename}.

${sitename}.       IN      A       ${ip}
${ip}       IN      PTR     ${sitename}." | sudo tee -a /etc/bind/db."${sitename}" > /dev/null

    printf "Registros de resolución directa e inversa añadidos al archivo de zona.\n"

    printf "Reiniciando servicio BIND...\n"
    sudo systemctl restart bind9

    printf "Configuración DNS para %s completada.\n" "${sitename}"
}

username=$(get_unique_user)
sitename=$(get_unique_site)

create_user_and_site "${username}" "${sitename}"
printf "\n"

create_virtual_host_config "${username}" "${sitename}"
printf "\n"

create_mysql_user_and_database "${username}" "${sitename}"
printf "\n"

#!! Cambiar ip por la deseada !!
config_dns "${sitename}" "192.168.1.136"
printf "\n"

printf "Moviendo configuración de %s.conf a sites-enabled" "${sitename}"

sudo a2ensite "${sitename}".conf
printf "\n"

sudo systemctl restart apache2

printf "El sitio web www.%s.com está configurado y listo para usar." "${sitename}"
