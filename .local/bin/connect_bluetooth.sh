#!/bin/env sh

if pactl info sink | grep "Default Sink: bluez_sink.AC_12_2F_EB_D6_98"; then
	bluetoothctl -- power off
else
	bluetoothctl -- power on
	bluetoothctl -- connect AC:12:2F:EB:D6:98
	sleep 2
	sink="$(pactl list short sinks | grep bluez_sink.AC_12_2F_EB_D6_98 | cut -f1)"
	pactl set-default-sink $sink
	pactl set-sink-volume $sink 25
fi
