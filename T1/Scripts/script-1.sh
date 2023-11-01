#!/bin/bash

# Comprueba si se proporcionó un puerto como argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <puerto>"
    exit 1
fi

puerto="$1"
archivo_configuracion="/etc/apache2/ports.conf"

# Comprueba si el puerto ya existe en la configuración de Apache
if grep -q "Listen $puerto" "$archivo_configuracion"; then
    echo "El puerto $puerto ya está presente en la configuración de Apache."
    exit 1
fi

# Agrega el puerto al archivo de configuración de Apache
echo "Listen $puerto" | sudo tee -a "$archivo_configuracion" > /dev/null
echo "Puerto $puerto añadido a la configuración de Apache."
