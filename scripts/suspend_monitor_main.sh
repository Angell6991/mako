#!/bin/bash

STATE_FILE="/tmp/lid_mode_state"
CONFIG="/etc/systemd/logind.conf"

NORMAL="HandleLidSwitch=suspend"
DOCKED="HandleLidSwitch=ignore"

# Leer estado actual
if [[ -f "$STATE_FILE" ]]; then
    MODE=$(cat "$STATE_FILE")
else
    MODE="normal"
fi

# Función para actualizar HandleLidSwitch
set_lid_mode() {
    local VALUE="$1"

    if grep -q "^HandleLidSwitch=" "$CONFIG"; then
        sudo sed -i "s/^HandleLidSwitch=.*/$VALUE/" "$CONFIG"
    elif grep -q "^#HandleLidSwitch=" "$CONFIG"; then
        sudo sed -i "s/^#HandleLidSwitch=.*/$VALUE/" "$CONFIG"
    else
        echo "$VALUE" | sudo tee -a "$CONFIG" >/dev/null
    fi
}

if [[ "$MODE" == "normal" ]]; then
    # Cambiar a ignore
    set_lid_mode "$DOCKED"

    echo "ignore" > "$STATE_FILE"

    notify-send "󰶐  Laptop cover action" "Close lid DOES NOT suspend"
    ~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_cover open icon-cover &

else
    # Restaurar suspend
    set_lid_mode "$NORMAL"

    echo "normal" > "$STATE_FILE"

    notify-send "󰍹  Laptop cover action" "Close lid suspends"
    ~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_cover kill &

fi

# IMPORTANTE:
# usar reload y NO restart
sudo systemctl reload systemd-logind
