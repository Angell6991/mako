#!/bin/bash

export  DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if      [ "$status" = "Full" ]; then
    notify-send "󰂄 Battery: $battery%" "full charge"
        
elif    [ "$status" = "Discharging" ]; then
    if  [ $battery -le 20 ]; then
        notify-send "󰁻 Battery: $battery%" "low battery level"
    fi

fi


