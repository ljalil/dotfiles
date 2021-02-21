#!/usr/bin/bash

state=$(bluetoothctl info)
if [[ $state == 'Missing device address argument' ]]; then
	echo 
else
	device_name=$(bluetoothctl info | grep Name | cut -d ' ' -f2)
	echo  $device_name
fi

