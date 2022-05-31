#!/bin/env sh
rfkill unblock 0
if bluetoothctl show | grep "Powered: yes"; then
	echo "Bluetooth is on... powering off"
	bluetoothctl -- power off
	pactl set-default-sink 0
	pactl set-sink-volume 0 50
else
	echo "Bluetooth is off... connecting to headset"
	bluetoothctl -- power on
	bluetoothctl agent on
	bluetoothctl default-agent
	bluetoothctl -- connect AC:12:2F:EB:D6:98
	sleep 5
	sink="$(pactl list short sinks | grep bluez_sink.AC_12_2F_EB_D6_98 | cut -f1)"
	pactl set-default-sink $sink
	pactl set-sink-volume $sink 25
fi
pactl list | grep -C2 A2DP
