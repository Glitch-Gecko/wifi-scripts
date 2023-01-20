#!/bin/bash

if [ -z $1 ]
then
	read -p "Enter bssid: " bssid
else
	bssid=$1
fi
if [ -z $2 ]
then
	read -p "Enter channel: " channel
else
	channel=$2
fi

echo "$bssid" > .bssid

sudo airodump-ng -c $channel --bssid $bssid -w captures/capture wlan0 --output-format pcap #rename wlan0 to interface
