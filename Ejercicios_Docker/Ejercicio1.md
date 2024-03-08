# Ejercicio 1
**[Enunciado](https://docs.google.com/document/d/1HE51pkqsTtjyOC40XQWP9MFjTMTXc-HYjVxT_UaKCpU/edit)**

## Instalación Docker en Ubuntu

Para instalar Docker en nuestra máquina de Ubuntu llevaremos a cabo los siguientes pasos:

Primero **actualizamos los paquetes existentes**:

```bash
sudo apt update
```

![Imagen 1](/Ejercicios_Docker/images/1/1.png)

Una vez actualizada la lista de paquetes, instalamos algunos paquetes de requisitos previos que permitan a apt usar paquetes a través de HTTPS:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

![Imagen 2](/Ejercicios_Docker/images/1/2.png)

Luego, añadimos la clave CPG para el repositorio de Docker:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Añadimos el repositorio de Docker a las fuentes APT:

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

![Imagen 3](/Ejercicios_Docker/images/1/3.png)

Ahora actualizamos los paquetes:

```bash
sudo apt update
```

Para asegurarnos que instalamos Docker desde el repositorio que hemos proporcionado y no desde el predeterminado de Ubuntu escribimos:

```bash
apt-cache policy docker-ce
```

![Imagen 4](/Ejercicios_Docker/images/1/4.png)

Una vez comprobado, instalamos Docker:

```bash 
sudo apt install docker-ce -y
```

![Imagen 5](/Ejercicios_Docker/images/1/5.png)

Una vez instalado, comprobamos que la instalación haya ido correctamente.

```bash
sudo systemctl status docker
```
![Imagen 6](/Ejercicios_Docker/images/1/6.png)
