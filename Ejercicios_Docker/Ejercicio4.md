# Ejercicio 4
**[Enunciado](https://docs.google.com/document/d/1mmfYZAXNPySvozUEa531FahRgSizjhGFSdjvhhyK78U/edit)**

### Ejemplo 1: Despliegue de la aplicación Guestbook

Creamos la red para los contenedores que irán conectados:
```bash 
docker network create red_guestbook
```
![Imagen1](/Ejercicios_Docker/images/4/1.png)

Creamos un fichero llamado docker-compose.yml y dentro le pondremos esto:
```bash
sudo nano docker-compose.yml
```
```bash
version: '3.1'
services:
  app:
    container_name: guestbook
    image: iesgn/guestbook
    restart: always
    ports:
      - 80:5000
  db:
    container_name: redis
    image: redis
    restart: always
```
![Imagen3](/Ejercicios_Docker/images/4/3.png)

Ahora usamos:

```bash
docker compose up -d
```
![Imagen2](/Ejercicios_Docker/images/4/2.png)

![Imagen3](/Ejercicios_Docker/images/4/4.png)

### Ejemplo 2: Despliegue de la aplicación Temperaturas

Creamos un docker-compose.yml:

```bash 
sudo nano docker-compose.yml
```

Y escribimos dentro lo siguiente:
```bash
version: '3.1'
services:
  frontend:
    container_name: temperaturas-frontend
    image: iesgn/temperaturas_frontend
    restart: always
    ports:
      - 80:3000
    depends_on:
      - backend
  backend:
    container_name: temperaturas-backend
    image: iesgn/temperaturas_backend
    restart: always
```

![Imagen5](/Ejercicios_Docker/images/4/5.png)

Usamos ```bash docker compose up -d ```:

![Imagen6](/Ejercicios_Docker/images/4/6.png)

![Imagen7](/Ejercicios_Docker/images/4/7.png)


