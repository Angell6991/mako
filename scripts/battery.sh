#!/bin/bash

export  DISPLAY=:0
export  DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export  PIPEWIRE_REMOTE=/run/user/1000/pipewire-0  

init_adjutora=$(~/.eww/target/release/eww -c ~/.config/mako/scripts/widget_starcarft  open adjutora-icon-glass)
kill_adjutora=$(~/.eww/target/release/eww -c ~/.config/mako/scripts/widget_starcarft  kil)


battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

ctl_batt_full="/tmp/battery_full"
ctl_batt_not="/tmp/battery_not"
ctl_batt_dis="/tmp/battery_dischar"


if      [ "$status" = "Full" ]  &&  [ ! -f "$ctl_batt_full" ]; then
    init_adjutora
    notify-send "󱈑 Battery: $battery%" "full charge"
    # ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
    ffplay -nodisp -autoexit ~/.config/mako/scripts/widget_starcarft/songs/investigacion.mp3
    touch   $ctl_batt_full
    sleep 2
    kill_adjutora


elif    [ "$status" = "Not charging" ]  &&  [ ! -f "$ctl_batt_not" ]; then
    notify-send "󰂃 Battery: $battery%" "Not charging"
    # ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
    ffplay -nodisp -autoexit ~/.config/mako/scripts/widget_starcarft/songs/aterrizaje.mp3
    touch   $ctl_batt_not
    sleep 2
    kill_adjutora

elif    [ "$status" = "Discharging" ]; then
    
    if  [ $battery -le 20 ]  &&  [ ! -f "$ctl_batt_dis" ]; then
        notify-send "󰁻 Battery: $battery%" "low battery level"
        # ffplay -nodisp -autoexit ~/.config/mako/scripts/songs/Blip.mp4
        ffplay -nodisp -autoexit ~/.config/mako/scripts/widget_starcarft/songs/energia.mp3
        touch   $ctl_batt_dis
        sleep 2
        kill_adjutora
    fi


elif    [ "$status" = "Charging" ]; then
    rm -f   $ctl_batt_full
    rm -f   $ctl_batt_dis    
    rm -f   $ctl_batt_not    


fi


