#!/bin/bash

# Variables
EPG_URL="https://opop.pro/DJBteReoA4q4f5t"
OUTPUT_FILE="epg8.xml"
COMPRESSED_FILE="epg8.xml.gz"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Descargar el archivo EPG
wget -O "$OUTPUT_FILE" "$EPG_URL"

# Modificar la etiqueta <tv generator-info-name>
sed -i 's|\(<tv generator-info-name="\)[^"]*|\1EPG 8|' "$OUTPUT_FILE" 
# Comprimir el archivo
gzip -f "$OUTPUT_FILE"

# Configurar git y subir cambios
git config --global user.email "ferteque98@gmail.com"
git config --global user.name "Ferteque"

# Subir cambios a GitHub
git add "$COMPRESSED_FILE"
git commit -m "EPG updated on $DATE"
git push origin main