#!/bin/bash

# Aumento en el brillo de la pantalla
brightnessctl set +10%

# Obtener el brillo actual usando brightnessctl
BRIGHTNESS=$(brightnessctl | grep -oP '\d+(?=%)')

# Mostrar la notificación con mako
# notify-send "brightness:" "  $BRIGHTNESS%"
dunstify -h int:value:"$BRIGHTNESS" -t 2000 -r 2593 "brightness:   $BRIGHTNESS %"


