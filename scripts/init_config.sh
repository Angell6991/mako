#!/bin/bash

WM=$(echo $XDG_SESSION_DESKTOP)
CONFIGDIR="$HOME/.config/fuzzel"

if [[ "$WM" == "Hyprland" ]]; then
  cp "$CONFIGDIR/fuzzel-hyprland.ini" "$CONFIGDIR/fuzzel.ini"

elif [[ "$WM" == "niri" ]]; then
  cp "$CONFIGDIR/fuzzel-niri.ini" "$CONFIGDIR/fuzzel.ini"

fi


