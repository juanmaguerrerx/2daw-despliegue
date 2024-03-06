# **Proyecto 2 Trimestre**
**_[Link al enunciado](https://docs.google.com/document/d/1wLt42AF9oQq4WcSOMjifCIYTC64uAV0Erm6mUt9H6bA/edit)_**

# Servidor de alojamiento web 

### Índice

- [Instalación Apache](#instalación-apache-en-ubuntu)
- [Instalación PHP](#instalación-php)
- [Directorio de usuario con página web](#directorio-de-usuario-con-una-página-web-por-defecto)
- [Instalación SQL](#instalación-sql)
- [Instalación PHPMyAdmin](#instalación-phpmyadmin)
- [Instalación FTP con certificado TLS](#instalacion-ftp-certificado-tls)
- [Instalación SSH y FTP ](#instalación-ssh-y-ftp)
- [Instalación Módulo Python](#módulo-python)
- ### [Script](#script-1)

## Instalación Apache en Ubuntu

Primero, para poder alojar páginas web estáticas y dinámicas, usaremos Apache2 para Ubuntu. Para instalarlo, desde la terminal ejecutamos los siguientes comandos:

*Actualizamos los paquetes del sistema:*
```bash
sudo apt update && sudo apt upgrade
```

*Instalamos Apache:*
```bash
sudo apt install apache2
```

![Imagen 1](/Practica_2_Trimestre/images/1.png)

![Imagen 2](/Practica_2_Trimestre/images/2.png)

Para verificar que se ha instalado correctamente podemos hacer un *status*:

```bash
sudo systemctl status apache2
```

<sub>He tenido que cambiar el entorno por motivos de errores de Kali a Ubuntu</sub>

![Imagen 3](/Practica_2_Trimestre/images/3.png)

Podemos ver que la instalación ha ido correctamente al entrar en *http://localhost*

![Imagen 4](/Practica_2_Trimestre/images/4.png)


## Instalación PHP

Para instalar PHP y los módulos necesarios para alojar páginas web ejecutaremos comando:

```bash
sudo apt install php libapache2-mod-php php-mysql
```

![Imagen 5](/Practica_2_Trimestre/images/5.png)

Para comprobar que ha ido todo bien escribiremos en consola: 
```bash
php -v
```
Esto nos dará la versión de php que tenemos instalada.

![Imagen 6](/Practica_2_Trimestre/images/6.png)

Ahora debemos reiniciar Apache para aplicar los cambios efectuados:

```bash
sudo systemctl restart apache2
```

## Directorio de usuario con una página web por defecto

Creamos un fichero con el editor de texto de nuestra preferencia (Vin, Nano, etc.) y tendremos que ajustarlo de la siguiente manera:

Para que sea ejecutable:
```bash
#!/bin/bash
```
```bash
echo "Ingrese el nombre de usuario"
read username

echo "Ingrese el nombre de la web:"
read sitename
```
![Imagen 7](/Practica_2_Trimestre/images/7.png)

Luego creamos el usuario y el directorio, se asigna el directorio al usuario y ajustamos los permisos:

```bash
sudo useradd $username

sudo mkdir /var/www/$sitename

sudo chown $username:$username /var/www/$sitename

sudo chmod 755 /var/www/$sitename
```


Una vez completado, crearemos un *index* para la página:

```bash
sudo echo "<html><body><h2>Hola, $username. Bienvenido a $sitename!</h2></body></html>" > /var/www/$sitename/index.html
```

El archivo completo:
![Imagen 8](/Practica_2_Trimestre/images/8.png)

## Instalación SQL

Instalamos SQL _(MySQL)_ con el siguiente comando:

```bash
sudo apt install mysql-server
```

![Imagen 9](/Practica_2_Trimestre/images/9.png)


Luego iniciaremos mysql:

```bash
sudo sysyemctl start mysql
```
Para asegurarnos de que ha sido iniciado, preguntaremos por el estado:
```bash
sudo systemctl status mysql
```

![Imagen 10](/Practica_2_Trimestre/images/10.png)


## Instalación PHPMyAdmin

Como venimos haciendo anteriormente, instalamos con el comando:

<sub>Recuerda tener actualizado el sistema: ```sudo apt update```</sub>
```bash
sudo apt install phpmyadmin
```

Cuando nos salga esta ventana:

![Imagen 11](/Practica_2_Trimestre/images/11.png)

Seleccionamos Apache2 ya que es el servicio que vamos a utilizar con PHPMyAdmin

Ahora nos dice que *phpmyadmin* necesita tener al menos una BBDD creada antes de funcionar para un funcionamiento correcto, que si queremos que nos cree una por defecto. Le diremos que si:

![Imagen 12](/Practica_2_Trimestre/images/12.png)

Y por último nos pedirá una contraseña:

![Imagen 13](/Practica_2_Trimestre/images/13.png)

Una vez completada la instalación reiniciamos *apache2*.

```bash
sudo systemctl restart apache2
```

Una vez finalizado, para comprobar el correcto funcionamiento solo tendríamos que ir a *http://localhost/phpmyadmin* en el navegador e introducir las credenciales que hemos introducido anteriormente.


## Instalacion FTP certificado TLS 

De la misma manera que en las anteriores ocasiones, instalamos con el mismo comando:

```bash
sudo apt install vsftpd
```

Para hacer un certificado TLS usaremos un comando que nos generara un cartificado autofirmado:

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
```

![Imagen 14](/Practica_2_Trimestre/images/14.png)

Una vez hecho, tenemos que ajustar la configuración del servidor para permitir que los clientes puedan conectarse:

```bash
sudo nano /etc/vsftpd.conf
```

Y al final del documento ponemos estas líneas:

![Imagen 15](/Practica_2_Trimestre/images/15.png)

Por último reiniciamos el servicio:
```bash
sudo systemctl restart vsftpd
```

## Instalación SSH y FTP 

Para instalar OpenSSH, ejecutamos:

```bash
sudo apt install openssh-server
```

Ahora activaremos el puerto 22 que es el que tiene por defecto, solo hay que eliminar el comentario del archivo.

```bash
sudo nano /etc/ssh/sshd_config
```
Eliminamos el *#* de la línea marcada.
![Imagen 16](/Practica_2_Trimestre/images/16.png)

Ahora, reinicamos el servicio:

```bash
sudo systemctl restart ssh
```
Y comprobamos el estado:
```bash
sudo systemctl status ssh
```

![Imagen 17](/Practica_2_Trimestre/images/17.png)


### Instalamos BIND9

```bash
sudo apt install bind9
```

![Imagen 18](/Practica_2_Trimestre/images/18.png)

Y reiniciamos apache:

```bash
sudo systemctl restart apache2
```
![Imagen 19](/Practica_2_Trimestre/images/19.png)



## Módulo Python

Para que nuestro servidor soporte aplicaciones en Python necesitamos importar su módulo:

```bash
sudo apt install libapache2-mod-wsgi-py3
```

Lo pasamos a los módulos activos y reiniciamos Apache

```bash
sudo a2enmod wsgi
```
```bash
sudo systemctl restart apache2
```

![Imagen 20](/Practica_2_Trimestre/images/20.png)
![Imagen 21](/Practica_2_Trimestre/images/21.png)


# Script

## Funciones

A modo de documentación del Script, explicaré las funciones creadas para el Script:

- [get_unique_user()](#get_unique_user)
- [get_unique_site()](#get_unique_site)
- [create_user_and_site()](#create_user_and_site)
- [create_virtual_host_config()](#create_virtual_host_config)
- [create_mysql_user_and_database()](#create_mysql_user_and_database)
- [config_dns()](#config_dns)

- ### __[Acceder al Script](/Practica_2_Trimestre/script.sh)__

## Explicación de Funciones

### `get_unique_user()`

Esta función se encarga de obtener un nombre de usuario único. Primero solicita al usuario que ingrese un nombre de usuario. Luego, verifica si ese nombre de usuario ya existe en el sistema. Si el nombre de usuario ya existe, solicita al usuario que ingrese otro nombre hasta que se proporcione uno único. Finalmente, devuelve el nombre de usuario único.

### `get_unique_site()`

Similar a `get_unique_user()`, esta función solicita al usuario que ingrese un nombre para un sitio web. Luego, verifica si ya existe un directorio para ese nombre de sitio web en `/var/www`. Si el nombre del directorio ya existe, solicita al usuario que ingrese otro nombre hasta que se proporcione uno único. Finalmente, devuelve el nombre único del sitio web.

### `create_user_and_site()`

Esta función crea un nuevo usuario en el sistema y un directorio para el sitio web en `/var/www`. Toma dos argumentos: el nombre de usuario y el nombre del sitio web. Utiliza los comandos `useradd` para crear el usuario y `mkdir` para crear el directorio del sitio web. Luego, establece el propietario y los permisos del directorio y crea un archivo `index.html` básico dentro de él.

### `create_virtual_host_config()`

Esta función crea y configura un archivo de host virtual para Apache. Toma dos argumentos: el nombre de usuario y el nombre del sitio web. Genera la configuración del host virtual con los parámetros proporcionados y la guarda en el directorio `sites-available` de Apache. Este archivo de configuración especifica la configuración del servidor virtual para el sitio web, como el nombre del servidor, el alias, la ruta del documento raíz y los registros de errores.

### `create_mysql_user_and_database()`

Esta función crea un nuevo usuario y una base de datos MySQL. Toma dos argumentos: el nombre de usuario y el nombre del sitio web. Primero, solicita al usuario la contraseña del usuario root de MySQL. Luego, verifica si la base de datos ya existe. Si la base de datos no existe, crea la base de datos y el usuario correspondiente, otorga todos los privilegios sobre la base de datos al usuario y actualiza los privilegios de MySQL.

### `config_dns()`

Esta función configura el servicio DNS para el sitio web. Toma dos argumentos: el nombre del sitio web y la dirección IP. Agrega una zona al archivo `named.conf.local` especificando el nombre del sitio web y el archivo de zona asociado. Luego, crea el archivo de zona correspondiente en `/etc/bind` con registros de resolución directa e inversa y reinicia el servicio BIND para aplicar los cambios.




