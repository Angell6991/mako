#!/bin/bash

# Función para pausar todo el audio con wpctl
pause_audio() {
    # Lista las sesiones; pausa todas las que están reproduciendo
    wpctl status | grep "State: Playing" | awk -F':' '/Node/{print $1}' | while read -r node_id; do
        wpctl set-node-paused "$node_id" true
    done
}

# Función para reanudar todo el audio con wpctl
resume_audio() {
    wpctl status | grep "State: Paused" | awk -F':' '/Node/{print $1}' | while read -r node_id; do
        wpctl set-node-paused "$node_id" false
    done
}

# Detectar si hay audio reproduciéndose (en estado Playing)
audio_playing=$(wpctl status | grep -c "State: Playing")

# Detectar si hay audio pausado
audio_paused=$(wpctl status | grep -c "State: Paused")

# Detectar si hay reproductores multimedia con playerctl
players=$(playerctl -l 2>/dev/null)

playing_players=$(playerctl status 2>/dev/null | grep -c "Playing")
paused_players=$(playerctl status 2>/dev/null | grep -c "Paused")

# Variables que indican si hay audio o video reproduciéndose o pausados
any_playing=$((audio_playing + playing_players))
any_paused=$((audio_paused + paused_players))

if [[ $any_playing -gt 0 ]]; then
    # Hay algo reproduciéndose, pausamos todo
    # echo "Audio o video detectado reproduciéndose. Pausando todo..."
    pause_audio
    notify-send "Audio and video:" "  paused"
    # Pausar todos los reproductores multimedia
    for p in $players; do
        playerctl -p "$p" pause
    done
elif [[ $any_paused -gt 0 ]]; then
    # Hay algo pausado, reanudamos todo
    # echo "Audio o video detectado pausado. Reanudando todo..."
    resume_audio
    notify-send "Audio and video:" "  unpaused"
    for p in $players; do
        playerctl -p "$p" play
    done
else
    echo "No hay audio o video reproduciéndose ni pausado. No se hace nada."
fi


