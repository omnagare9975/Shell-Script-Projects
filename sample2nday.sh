#!/bin/bash

read -p 'Enter Your Name and city' name city

echo -e "
      Hello $name from $city!
      Today is: $(date)
      Logged in user: $USER
      "

