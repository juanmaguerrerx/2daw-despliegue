# Ejercicio 2
**[Enunciado](https://docs.google.com/document/d/1aw-7nDdtLTgCLiIaW6CTQ7fTRRdVSi07_INrbnmM55M/edit)**

### Ejecutar la imagen _hello-world_

Para llevarlo a cabo, simplemente ejecutamos:

```bash
docker run hello-world
```

![Imagen 1](/Ejercicios_Docker/images/2/1.png)

### Mostrar las imagenes instaladas

Para mostrar las imágenes instaladas en Docker, ejecutaremos lo siguiente:

```bash
docker image ls
```
![Imagen 2](/Ejercicios_Docker/images/2/2.png)

### Mostrar los contenedores Docker

Para mostrar los contenedores simplemente escribimos:

```bash
docker container ls -a
```

![Imagen 3](/Ejercicios_Docker/images/2/3.png)

### Editar archivo _Dockerfile_

Primero vamos a conseguir una aplicación para probar:

```bash
git clone https://github.com/docker/getting-started.git
```

Vamos a la ruta _getting-started/app_:

```bash
sudo nano Dockerfile
```

Ponemos esto dentro:
![Imagen 4](/Ejercicios_Docker/images/2/4.png)

Construimos el contenedor:

```bash
docker build -t getting-started
```
El proceso tardará un poco:
![Imagen 5](/Ejercicios_Docker/images/2/5.png)

Para ejecutarlo ejecutaremos este comando:
```bash
docker run -dp 3000:3000 getting-started
```

Una vez listo, si vamos a http://localhost:3000 nos saldrá lo siguiente:
![Imagen 6](/Ejercicios_Docker/images/2/6.png)

### Crear una cuenta en DockerHub

En este caso, yo ya tengo una cuenta creada, vinculada a mi cuenta de GitHub, pero los pasos son:

- Dirigirse a la página de [DockerHub](https://hub.docker.com)

- Pulsar arriba a la izquierda donde dice Sign Up (Sign In si ya tienes cuenta)
- Y rellenar el formulario de registro

![Imagen 7](/Ejercicios_Docker/images/2/7.png)

### Publicar un contenedor en DockerHub

Debemos tener una cuenta y conectarla con docker login metiendo las credenciales.

```bash 
sudo docker tag getting-started:latest juanmaguerrerx/juanma:juanma
```

Y lo subimos con el sigiuente comando:

```bash 
sudo docker push juanmaguerrerx/juanma:juanma
```

Y listo ya lo tendríamos subido. 