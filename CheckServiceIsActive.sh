#!/bin/bash


read -p "Enter The Name of Service Want to Check/n" Service

if systemctl is-active --quiet $Service
then
	echo "Services $Service Is Running"
else
	echo "Service $Service  is Not Running"
fi

