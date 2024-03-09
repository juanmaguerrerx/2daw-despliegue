# Ejercicio 4
**[Enunciado](https://docs.google.com/document/d/1mmfYZAXNPySvozUEa531FahRgSizjhGFSdjvhhyK78U/edit)**

### Ejemplo 1: Despliegue de la aplicación Guestbook

Creamos la red para los contenedores que irán conectados:
```bash 
docker network create red_guestbook
```
![Imagen1](/Ejercicios_Docker/images/4/1.png)

Ejecutaremos los contenedores:
```bash 
docker run -d --name redis --network red_guestbook -v /opt/redis:/data redis redis-server --appendonly yes
```
```bash
docker run -d -p 80:5000 --name guestbook --network red_guestbook iesgn/guestbook
```