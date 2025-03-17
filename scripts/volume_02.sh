#!/bin/bash

# Disminuye el volumen en 5%
amixer sset Master 5%-

# Obtener el volumen actual
VOL=$(pamixer --get-volume-human)

# Enviar la notificación a Mako
notify-send "Volume:" "  $VOL"
