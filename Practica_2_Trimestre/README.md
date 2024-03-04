# Proyecto 2 Trimestre
**[Link al enunciado](https://docs.google.com/document/d/1wLt42AF9oQq4WcSOMjifCIYTC64uAV0Erm6mUt9H6bA/edit)**

## Servidor de alojamiento web 

### Instalación Apache en Ubuntu

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

