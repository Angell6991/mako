#!/bin/bash

# Verificamos si hypridle está corriendo

if pgrep -x "hypridle" > /dev/null; then
    notify-send "󱚳  System security:" "automatic screen lock disabled"
    ~/.eww/target/release/eww -c ~/.config/eww/widget_lock open lock-icon-glass &
    pkill -x hypridle

else
    notify-send "󱎚  System security:" "automatic screen lock activated"
    ~/.eww/target/release/eww -c ~/.config/eww/widget_lock kill &
    hypridle &

    hyprctl reload &

fi
