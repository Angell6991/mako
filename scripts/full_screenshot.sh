#!/bin/bash

# Captura de pantalla
NAME=~/Images/capturas/$(date +%Y-%m-%d-%T).png
grim $NAME 

# Enviar la notificación a Mako
notify-send "󰋩 Screenshot:" "~/Images/capturas/"

# Abrir editor de imagen
satty --filename $NAME 


