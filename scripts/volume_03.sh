#!/bin/bash

# altenar entre mute
amixer set Master toggle

# Obtener el volumen actual
VOL=$(pamixer --get-volume-human)

# Enviar la notificación a Mako
notify-send "Volume:" "  $VOL"
