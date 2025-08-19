#!/bin/bash

# Variables
EPG_URL="https://opop.pro/BTRSuLs9CB2A"
OUTPUT_FILE="epg12.xml"
COMPRESSED_FILE="epg12.xml.gz"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Descargar el archivo EPG
wget -O "$OUTPUT_FILE" "$EPG_URL"

# Modificar la etiqueta <tv generator-info-name>
sed -i 's|\(<tv generator-info-name="\)[^"]*|\1EPG 12|' "$OUTPUT_FILE" 
sed -i 's|\(<tv[^>]*generator-info-url="\)[^"]*|\1https://repo-server.site|' "$OUTPUT_FILE"
# Comprimir el archivo
gzip -f "$OUTPUT_FILE"

# Configurar git y subir cambios
git config --global user.email "ferteque98@gmail.com"
git config --global user.name "Ferteque"

# Subir cambios a GitHub
git add -f "$COMPRESSED_FILE"
git commit -m "EPG updated on $DATE"
git push origin main
