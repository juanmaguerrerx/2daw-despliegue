# Practica 1 Trimestre - Juan Manuel Guerrero
## Servidores Web

### 1. INSTALACION APACHE
<a name="instAp"></a>
Primero, instalamos apache con el comando:
```linux
sudo apt get install apache2
```

### 2. CONFIGURAR VIRTUALHOSTS
<a name="confVH"></a>
En el archivo _hosts_, escribiremos los nuevos hosts correspondientes:
Para acceder al archivo: ```sudo nano etc/hosts```
![imagen3](./images/3.png)

Ahora nos dirigimos a la terminal de nuevo y creamos los archivos _centro.intranet.conf_ y _departamentos.centro.intranet.conf_
en el fichero _sites-availables_:
```linux
sudo nano /etc/apache2/sites-available/centro.intranet.conf
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```
Y se nos abrirá el editor donde deberemos escribir lo siguiente:

**En centro.intranet.config:**
```xml                                                                            
<VirtualHost *:80>
  ServerAdmin webmaster@centro.intranet
  ServerName centro.intranet
  DocumentRoot /var/www/centro.intranet

  <Directory /var/www/centro.intranet/>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
  </Directory>

  ErrorLog ${APACHE_LOG_DIR}/centro.intranet_error.log
  CustomLog ${APACHE_LOG_DIR}/centro.intranet_access.log combined
</VirtualHost>
```

**En departamentos.centro.intranet:**
```xml                                                                            
<VirtualHost *:80>
    ServerAdmin webmaster@departamentos.centro.intranet
    ServerName departamentos.centro.intranet
    DocumentRoot /var/www/departamentos.centro.intranet

    <Directory /var/www/departamentos.centro.intranet/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/departamentos.centro.intranet_error.log
    CustomLog ${APACHE_LOG_DIR}/departamentos.centro.intranet_access.log combined
</VirtualHost>
```

### Crear directorios
<a name="crearDir"></a>
Crearemos los directorios correspondientes a cada uno de los sitios en _var/www/_

```linux
sudo mkdir /var/www/centro.intranet
sudo mkdir /var/www/departamentos.centro.intranet
```

### Habilitar el módulo PHP
<a name="habPhp"></a>
Instalamos el módulo PHP en Apache:
```linux
sudo apt install libapache2-mod-php
```
```linux
sudo a2enmod php8.2(version que tengamos 'php -v')
```
![imagen1](./images/1.png)

### Habilitar el módulo MySql
<a name="habMSQL"></a>
Para habilitar el módulo MySql en PHP, haremos lo siguiente:
```linux
sudo apt install php-mysql
```
```linux
sudo systemctl restart apache2
```

### Activar MySql
<a name="activMSQL"></a>
Para ello, escribiremos lo siguiente:

```linux
sudo apt install mysql-server
```
Ahora vamos a entrar, escribiendo:
```linux
mysql -u root -p
```
![imagen4](./images/4.png)

Crearemos una base de datos llamada _PracticaJ_ por ejemplo:

```sql
CREATE DATABASE PracticaJ
```

Y veremos si se ha creado con la línea ```SHOW DATABASES```
![imagen5](./images/5.png)
