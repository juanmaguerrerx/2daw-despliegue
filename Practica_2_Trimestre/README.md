# **Proyecto 2 Trimestre**
**_[Link al enunciado](https://docs.google.com/document/d/1wLt42AF9oQq4WcSOMjifCIYTC64uAV0Erm6mUt9H6bA/edit)_**

# Servidor de alojamiento web 

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



