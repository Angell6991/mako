#!/bin/bash


# Captura de pantalla
grim -g "$(slurp)" /tmp/scan_screenshot.png


# Enviar la notificación a Mako
notify-send "󰐲 Scan Screenshot:" "/tmp/scan_screenshot.txt"


# scam screenshot on zbar -- zbarimg
output=$(zbarimg  /tmp/scan_screenshot.png) 
echo    "$output"    >>   /tmp/scan_screenshot.txt
echo    " "         >>  /tmp/scan_screenshot.txt


