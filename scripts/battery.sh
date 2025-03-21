#!/bin/bash

export  DISPLAY=:0
export  DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export  PIPEWIRE_REMOTE=/run/user/1000/pipewire-0  


battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)


if      [ "$status" = "Full" ]; then
    notify-send "󰂄 Battery: $battery%" "full charge"
    ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
    

elif    [ "$status" = "Discharging" ]; then
    
    if  [ $battery -le 99 ]; then
        notify-send "󰁻 Battery: $battery%" "low battery level"
        ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
    fi


fi


