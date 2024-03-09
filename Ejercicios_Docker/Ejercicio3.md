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
![Imagen5]()