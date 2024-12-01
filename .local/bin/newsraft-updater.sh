#!/bin/bash

while true; do
	# realod feeds
	newsraft -e reload-all >/dev/null
	# update display
	printf "📰 %4d\n" $(newsraft -e print-unread-items-count)
	# wait one hour
	sleep 3600
done
