#!/bin/bash

# Variables
EPG_URL="https://myepg.top/?download_file=34879&order=wc_order_2cQ63QFf7NVfu&uid=dc04dca84a92300a6c9ebf9b5466fe4287f94444429cf4291191d71a59c1d282&key=ea790d17-c8a0-469f-bd7f-14b544ff92ca"
OUTPUT_FILE="epgX.xml"
COMPRESSED_FILE="epgX.xml.gz"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Descargar el archivo EPG
wget -O "$COMPRESSED_FILE" "$EPG_URL"

gunzip -f "$COMPRESSED_FILE"

# Modificar la etiqueta <tv generator-info-name>
sed -i 's|\(<tv generator-info-name="\)[^"]*|\1EPG X|' "$OUTPUT_FILE" 
# Comprimir el archivo
gzip -f "$OUTPUT_FILE"

# Configurar git y subir cambios
git config --global user.email "ferteque98@gmail.com"
git config --global user.name "Ferteque"

# Subir cambios a GitHub
git add "$COMPRESSED_FILE"
git commit -m "EPG updated on $DATE"
git push origin main