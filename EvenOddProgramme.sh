#!/bin/bash


num=1

while [ $num -le 10 ];
do
	if [ $(($num % 2)) -eq 0 ];
	then
	       echo "$num"
        fi

	((num++))
done	
