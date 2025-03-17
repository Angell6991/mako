#!/bin/bash

# Captura de pantalla
grim -g "$(slurp)" ~/Imágenes/capturas/$(date +%Y-%m-%d-%T).png

# Enviar la notificación a Mako
notify-send "  Screenshot:" "~/Imágenes/capturas/"
