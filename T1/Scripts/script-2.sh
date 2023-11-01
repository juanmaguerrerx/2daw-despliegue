#!/bin/bash

# Comprueba si se proporcionaron un dominio y una IP como argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <dominio> <ip>"
    exit 1
fi

dominio="$1"
ip="$2"
archivo_hosts="/etc/hosts"

# Comprueba si el dominio ya existe en el archivo hosts
if grep -q -E "^\s*$ip\s+$dominio\s*$" "$archivo_hosts"; then
    echo "El dominio $dominio ya existe en el archivo hosts."
    exit 1
fi

# Agrega el dominio y la IP al archivo hosts
echo "$ip $dominio" | sudo tee -a "$archivo_hosts" > /dev/null
echo "Dominio $dominio con IP $ip añadido al archivo hosts."
