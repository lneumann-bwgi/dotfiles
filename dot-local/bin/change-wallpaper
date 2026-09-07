#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="$HOME/.wallpapers"

# Wait for hyprpaper to be ready
until pgrep -x hyprpaper &>/dev/null; do
  sleep 0.5
done
sleep 1

last_wallpaper=""

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

  if [ "$WALLPAPER" != "$last_wallpaper" ]; then
    if [ -f "$FULL_PATH" ]; then
      while IFS= read -r monitor; do
        hyprctl hyprpaper wallpaper "$monitor,$FULL_PATH" || true
      done < <(hyprctl monitors -j | jq -r '.[].name')
      last_wallpaper="$WALLPAPER"
    else
      echo "Error: $FULL_PATH not found."
    fi
  fi

  # Sleep until top of next hour (bucket boundary aligns to hour).
  now=$(date +%s)
  sleep $((3600 - now % 3600))
done
