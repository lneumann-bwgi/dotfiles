#!/bin/env sh
if setxkbmap -query | grep --quiet us; then
	setxkbmap -model thinkpad -layout br -variant abnt2
else
	setxkbmap -model thinkpad -layout us
fi
