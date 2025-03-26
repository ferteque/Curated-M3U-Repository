#!/bin/bash

# Variables
EPG_URL="https://opop.pro/ha5ARF9CuQQdbM"
OUTPUT_FILE="epg3.xml"
COMPRESSED_FILE="epg3.xml.gz"

# Descargar el archivo EPG
wget -O "$OUTPUT_FILE" "$EPG_URL"

# Modificar la etiqueta <tv generator-info-name>
sed -i "s|<tv generator-info-name=\".*\">|<tv generator-info-name=\"EPG 3\">|g" "$OUTPUT_FILE"

# Comprimir el archivo
gzip -f "$OUTPUT_FILE"

# Configurar git y subir cambios
git config --global user.email "ferteque98@gmail.com"
git config --global user.name "Ferteque"

# Subir cambios a GitHub
git add "$COMPRESSED_FILE"
git commit -m "EPG updated on $DATE"
git push origin main