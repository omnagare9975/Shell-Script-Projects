#!/bin/bash

while true; do
  clear
  tail -n 20 /var/log/syslog
  echo "Press [Q] to quit or wait 5 seconds..."
  read -t 5 -n 1 input
  if [[ $input == "q" || $input == "Q" ]]; then
    break
  fi
done

