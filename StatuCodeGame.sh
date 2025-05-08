#!/bin/bash



URL="www.google.com"

STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

if [ $STATUS_CODE -ne 200 ];
then
	echo "SERVER IS DOWN pls Check"
else
	echo "SERVER IS RUNNING"
fi




