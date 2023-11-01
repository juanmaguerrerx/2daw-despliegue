
#!/bin/bash

# Comprueba si se proporcionaron título, cabecera y mensaje como argumentos
if [ $# -ne 3 ]; then
    echo "Uso: $0 <título> <cabecera> <mensaje>"
    exit 1
fi

titulo="$1"
cabecera="$2"
mensaje="$3"

# Crea un archivo HTML con el contenido proporcionado
pagina_html="<!DOCTYPE html>
<html>
<head>
    <title>$titulo</title>
</head>
<body>
    <h1>$cabecera</h1>
    <p>$mensaje</p>
</body>
</html>"

# Genera un nombre de archivo único basado en la fecha y hora
archivo_html="pagina_$(date +'%Y%m%d%H%M%S').html"

# Guarda el contenido en el archivo HTML
echo "$pagina_html" > "$archivo_html"
echo "Página web creada como '$archivo_html'."
