#!/bin/bash

sudo systemctl stop NetworkManager
sudo airmon-ng check kill
sudo airmon-ng start wlan0 #rename to adapter name, check with ifconfig
sudo airodump-ng wlan0
