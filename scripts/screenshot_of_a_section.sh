#!/bin/bash

# Captura de pantalla
grim -g "$(slurp)" ~/Images/capturas/$(date +%Y-%m-%d-%T).png

# Enviar la notificación a Mako
notify-send "  Screenshot:" "~/Images/capturas/"
