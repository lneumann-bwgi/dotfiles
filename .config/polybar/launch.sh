#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep 'HDMI2 connected'; then
  polybar monitor &
elif xrandr --query | grep 'DP2 connected'; then
  polybar monitor &
else
  polybar laptop &
fi

echo "Polybar launched..."
