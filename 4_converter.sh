#!/bin/bash

read -p "Enter file name (i.e. 'capture-01'): " name

if [ -z "$name" ]
then
	name="capture-01"
fi
hcxpcapngtool captures/capture-01.cap -o hashes/capture-01.22000
