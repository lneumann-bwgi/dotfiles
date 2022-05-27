#!/bin/env sh

sink="$(pactl info | gawk 'match($0, /Default Sink: (.*)/, a) {print a[1]}')"
sink_id="$(pactl list short sinks | grep $sink | head -n 1 | cut -f1)"

if [ "$1" == "mute" ]; then
	pactl set-sink-mute $sink_id toggle
else
	pactl set-sink-mute $sink_id false
	pactl set-sink-volume $sink_id $1
fi
