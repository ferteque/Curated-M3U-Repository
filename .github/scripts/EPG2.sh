#!/bin/bash

# Variables
EPG_URL="https://opop.pro/tzrVuM4EZku2x"
OUTPUT_FILE="epg2.xml"
COMPRESSED_FILE="epg2.xml.gz"

# Descargar el archivo EPG
wget -O "$OUTPUT_FILE" "$EPG_URL"

# Modificar la etiqueta <tv generator-info-name>
sed -i "s|<tv generator-info-name=\".*\">|<tv generator-info-name=\"EPG 2\">|g" "$OUTPUT_FILE"

# Comprimir el archivo
gzip -f "$OUTPUT_FILE"

# Configurar git y subir cambios
git config --global user.email "ferteque98@gmail.com"
git config --global user.name "Ferteque"

# Subir cambios a GitHub
git add "$COMPRESSED_FILE"
git commit -m "EPG updated on $DATE"
git push origin main