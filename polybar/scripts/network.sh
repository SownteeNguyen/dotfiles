#!/bin/sh

if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null ; then
	wifiicon="$(awk '/^\s*w/ { print "直 "}' /proc/net/wireless)"
elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null ; then
	wifiicon="睊 No Wifi"
fi

echo "$wifiicon"
