#!/bin/bash

# Obtener brillo actual
BRIGHTNESS=$(brightnessctl | grep -oP '\d+(?=%)')

if [ "$BRIGHTNESS" -le 10 ]; then
    # Solo mostrar el brillo actual
    dunstify \
        -h int:value:"$BRIGHTNESS" \
        -t 2000 \
        -r 2593 \
        "brightness:   $BRIGHTNESS %"
else
    # Bajar brillo
    brightnessctl set 10%- > /dev/null

    # Obtener nuevo valor
    NEW_BRIGHTNESS=$(brightnessctl | grep -oP '\d+(?=%)')

    # Mostrar nuevo brillo
    dunstify \
        -h int:value:"$NEW_BRIGHTNESS" \
        -t 2000 \
        -r 2593 \
        "brightness:   $NEW_BRIGHTNESS %"
fi



