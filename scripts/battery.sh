#!/bin/bash

export  DISPLAY=:0
export  DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export  PIPEWIRE_REMOTE=/run/user/1000/pipewire-0  


battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

ctl_batt_full="/tmp/battery_full"
ctl_batt_not="/tmp/battery_not"
ctl_batt_dis="/tmp/battery_dischar"


if      [ "$status" = "Full" ]  &&  [ ! -f "$ctl_batt_full" ]; then
    notify-send "󱈑 Battery: $battery%" "full charge"
    ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
    touch   $ctl_batt_full


elif    [ "$status" = "Not charging" ]  &&  [ ! -f "$ctl_batt_not" ]; then
    notify-send "󰂃 Battery: $battery%" "Not charging"
    ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
    touch   $ctl_batt_not


elif    [ "$status" = "Discharging" ]; then
    
    if  [ $battery -le 20 ]  &&  [ ! -f "$ctl_batt_dis" ]; then
        notify-send "󰁻 Battery: $battery%" "low battery level"
        ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
        touch   $ctl_batt_dis
    fi


elif    [ "$status" = "Charging" ]; then
    rm -f   $ctl_batt_full
    rm -f   $ctl_batt_dis    
    rm -f   $ctl_batt_not    


fi


