#!/bin/bash
IP="10.0.0.138"
# IP="192.168.1.1"
while true ; do
	if ! ping -c 4 "$IP" ; then
		service network restart
		# /etc/init.d/networkmanager restart
		sleep 10
	fi
	sleep 5
done
