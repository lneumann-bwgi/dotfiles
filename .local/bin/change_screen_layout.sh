#!/usr/bin/env sh

if xrandr --query | grep 'HDMI2 connected'; then
	xrandr --output eDP1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 2560x1080 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
	bspc monitor HDMI2 -d I II III IV V VI VII VIII
	bspc monitor eDP1 -d IX X
	bspc wm -O HDMI2 eDP1
	setxkbmap -layout us
else
	bspc monitor eDP1 -d I II III IV V VI VII VIII IX X
	setxkbmap -model thinkpad -layout br -variant abnt2
fi
