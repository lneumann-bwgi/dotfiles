#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar laptop &

external_monitor=$(xrandr --query | grep 'HDMI2')
if [[ $external_monitor = "* connected *" ]]; then
	polybar monitor &
fi

echo "Polybar launched..."
