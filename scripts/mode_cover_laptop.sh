#!/bin/bash

CONFIG="/etc/systemd/logind.conf"

show_lid_status() {
    local MODE

    MODE=$(grep "^HandleLidSwitch=" "$CONFIG" | cut -d= -f2)

    if [[ "$MODE" == "ignore" ]]; then
        ~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_cover open icon-cover &
    fi
}

# Punto de entrada
show_lid_status
