# Ejercicio 3
**[Enunciado](https://docs.google.com/document/d/1oXWiIOeo_E19RI7CCiqu_sqHYHk0tDx6pPKaLeI6uH8/edit)**

### Descargar la imagen de Ubuntu

```bash
docker pull ubuntu
```
![Imagen1](/Ejercicios_Docker/images/3/1.png)

### Descargar la imagen de _hello-world_
```bash
docker pull hello-world
```
![Imagen2](/Ejercicios_Docker/images/3/2.png)

### Descargar la imagen _nginx_
```bash
docker pull nginx
```
![Imagen3](/Ejercicios_Docker/images/3/3.png)

### Mostrar todas las imagenes
```bash
docker images
```
![Imagen4](/Ejercicios_Docker/images/3/4.png)

### Ejecutar un contenedor hello-world y poner de nombre _myhello1_
```bash
docker run --name myhello1 hello-world
```
![Imagen5](/Ejercicios_Docker/images/3/5.png)

### Ejecutar un contenedor hello-world y poner de nombre _myhello2_
```bash 
docker run --name myhello2 hello-world
```
![Imagen6](/Ejercicios_Docker/images/3/6.png)

### Ejecutar un contenedor hello-world y poner de nombre _myhello3_
```bash
docker run --name myhello3 hello-world
```
![Imagen7](/Ejercicios_Docker/images/3/7.png)

### Mostrar los contenedores que se están ejecutando
```bash
docker ps
```
![Imagen8](/Ejercicios_Docker/images/3/8.png)

### Parar el contenedor _myhello1_, _myhello2_ y borrar _myhello1_
```bash
docker stop myhello1
```
```bash
docker stop myhello2
```
```bash
docker rm myhello1
```
![Imagen9](/Ejercicios_Docker/images/3/9.png)

### Mostrar los contenedores que se están ejecutando 
```bash
docker container ls -a
```
![Imagen10](/Ejercicios_Docker/images/3/10.png)

### Borrar todos los contenedores
```bash 
docker rm $(docker ps -aq)
```
![Imagen11](/Ejercicios_Docker/images/3/11.png)

Listamos los contenedores de nuevo:
```bash
docker container ls -a
```
![Imagen12](/Ejercicios_Docker/images/3/12.png)