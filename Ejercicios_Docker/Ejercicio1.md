# Ejercicio 1
**[Enunciado](https://docs.google.com/document/d/1HE51pkqsTtjyOC40XQWP9MFjTMTXc-HYjVxT_UaKCpU/edit)**

## Instalación Docker en Ubuntu

Para instalar Docker en nuestra máquina de Ubuntu llevaremos a cabo los siguientes pasos:

Primero **actualizamos los paquetes existentes**:

```bash
sudo apt update
```

![Imagen 1](/Ejercicios_Docker/images/1.png)

Una vez actualizada la lista de paquetes, instalamos algunos paquetes de requisitos previos que permitan a apt usar paquetes a través de HTTPS:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

![Imagen 2](/Ejercicios_Docker/images/2.png)

Luego, añadimos la clave CPG para el repositorio de Docker:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

