#!/bin/bash

# Enviar la notificación a Mako
notify-send "  Recording screen:" "~/Imágenes/capturas/"

# Espera para iniciar
sleep 6

# Inicia grabación de pantalla
wf-recorder -f ~/Imágenes/capturas/$(date +%Y-%m-%d-%T).mp4
