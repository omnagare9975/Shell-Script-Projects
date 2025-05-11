#!/bin/bash





ACCESS_LOGS(){


          while true; do
         
	          clear

                  echo "**********NGINX ACCESS LOGS*************"


	          tail -n 10 /var/log/nginx/access.log


	          echo "*******END ACCESS LOGS******************" 
        

	          echo "press ctrl + c to stop"

 	          sleep 5
      	  done
}




Error_Logs(){
         
	 while true; do

		 clear

		 echo "****************NGINX ERROR LOGS***************"

		 tail -n 10 /var/log/nginx/error.log


		 echo "****************END ERROR LOGS***************"

		 sleep 5
         done
 
}



ACCESS_LOGS
Error_Logs
