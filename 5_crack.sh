#!/bin/bash

read -p "Enter file name (i.e. 'capture-01'): " name
read -p "Brute force (b) or wordlist (w) (defaults to wordlist)? " option



if [ -z "$name" ]
then
	name="capture-01"
fi
if [ "$option" == "b" ]
then
	hashcat -a 3 -m 22000 hashes/$name.22000 -o passwords/$name.txt
else
	read -p "Enter wordlist path (defaults /usr/share/wordlists/rockyou.txt): " path
	if [ -z "$path" ]
	then
		path="/usr/share/wordlists/rockyou.txt"
	fi
	hashcat -a 0 -m 22000 hashes/$name.22000 $path -o passwords/$name.txt
fi

awk 'NF > 0' passwords/$name.txt | awk -F':' '{print $4":"$5}' | awk '!seen[$0]++' > password.tmp && mv password.tmp passwords/$name.txt 
