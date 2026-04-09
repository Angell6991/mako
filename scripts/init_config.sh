#!/bin/bash

WM=$(echo $XDG_SESSION_DESKTOP)
CONFIGDIR="$HOME/.config/fuzzel"
NOTIFY="$HOME/.config/mako"

if [[ "$WM" == "Hyprland" ]]; then
  cp "$CONFIGDIR/fuzzel-hyprland.ini" "$CONFIGDIR/fuzzel.ini"
  cp "$NOTIFY/config-hyprland" "$NOTIFY/config"

elif [[ "$WM" == "niri" ]]; then
  cp "$CONFIGDIR/fuzzel-niri.ini" "$CONFIGDIR/fuzzel.ini"
  cp "$NOTIFY/config-niri" "$NOTIFY/config"

fi


