#!/bin/bash

# Obtener el brillo actual usando brightnessctl
BRIGHTNESS=$(brightnessctl | grep -oP '\d+(?=%)')

if  [ $BRIGHTNESS -le 10 ]; then
    dunstify -h int:value:"$BRIGHTNESS" -t 2000 -r 2593 "brightness:   $BRIGHTNESS %"
else
    BRIGHTNESS=$(brightnessctl | grep -oP '\d+(?=%)')
    brightnessctl set 10%-
    dunstify -h int:value:"$BRIGHTNESS" -t 2000 -r 2593 "brightness:   $BRIGHTNESS %"
fi



