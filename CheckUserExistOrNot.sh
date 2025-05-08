#!/bin/bash

user="omnagare"

if id $user &> /dev/null; then
	echo "User $user Exist"

	if [ -d "/home/$user" ];
	then
		echo "home Directory Exist for $user"
	else
		echo "No Directory"
	fi
else
	echo "User Not Exist"
fi
