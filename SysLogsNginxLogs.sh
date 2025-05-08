#!/bin/bash


SYSTEM_LOGS(){
          echo "************SYSTEM LOGS**************"

	  while true; do

		  clear
		  tail  -n 10 /var/log/syslog
                          
		  sleep 5

                  echo "**************LOGS ENDED***************" 
		  
		  echo "Press ctrl+C to stop the logs"

           done
         

}

SYSTEM_LOGS
