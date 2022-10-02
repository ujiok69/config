#!/bin/bash

INDEXINUSE=$(pacmd list-sinks | grep "index:" | grep '*' | awk '{print $3}')

if [[ ! "${1}" =~ ^[-+] ]]; then
    pactl set-sink-mute $INDEXINUSE toggle # &>/dev/null
else
    pactl set-sink-volume $INDEXINUSE $1 #&>/dev/null
fi
