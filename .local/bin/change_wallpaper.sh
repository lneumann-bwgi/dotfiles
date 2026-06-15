#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="$HOME/.wallpapers"
MONITORS=("DP-2" "eDP-1")

# Wait for hyprpaper to be ready
until pgrep -x hyprpaper &>/dev/null; do
  sleep 0.5
done
sleep 1

while true; do
  HOUR=$(date +%-H)

  case $HOUR in
  2 | 3 | 4 | 5 | 6)
    WALLPAPER="thomas_cole-the_course_of_empire_1-_the_savage_state-1834-obelisk-art-history.jpg"
    ;;
  7 | 8 | 9 | 10 | 11)
    WALLPAPER="thomas_cole-the_course_of_empire_2-_the_pastoral_state-1834-obelisk-art-history.jpg"
    ;;
  12 | 13 | 14 | 15 | 16)
    WALLPAPER="thomas_cole-the_course_of_empire_3-_the_consummation_of_empire-1836-obelisk-art-history-1.jpg"
    ;;
  17 | 18 | 19 | 20 | 21)
    WALLPAPER="thomas_cole-the_course_of_empire_4-_destruction-1836-obelisk-art-history.jpg"
    ;;
  *)
    WALLPAPER="thomas_cole-the_course_of_empire_5-_desolation-1836-obelisk-art-history.jpg"
    ;;
  esac

  FULL_PATH="$WALLPAPER_DIR/$WALLPAPER"

  if [ -f "$FULL_PATH" ]; then
    for monitor in "${MONITORS[@]}"; do
      hyprctl hyprpaper wallpaper "$monitor,$FULL_PATH"
    done
  else
    echo "Error: $FULL_PATH not found."
  fi

  sleep 10m
done
