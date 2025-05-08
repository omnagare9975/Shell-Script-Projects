#!/bin/bash



CPU_USE(){
       echo "-----------CPU MONITORING-------------------------"
	     
       CPU=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')
      
       CPU_INT=$( echo "$CPU > 80" | bc )

       if [ "$CPU_INT" -eq 1 ]; 
       then
	       echo "CPU USE = $CPU %   WARNING = CPU HAS REACHED LIMITS !!!"
       else
               echo "CPU USE = $CPU %   INFO = OK "
       fi
}


MEM_USE(){

      echo "---------------MEM MONITORING--------------"
      read total used  <<< $( free -m | awk 'NR==2{print $2 , $3}')
      
      percentage=$(( used * 100 / total))

      MEM_INT=$( echo "$percentage > 80" | bc)

      if [ "$MEM_INT" -eq 1 ]
      then
	      echo "MEM USE = $percentage % WARNING = MEM HAS REACHED LIMITS !!!"
      else
	      echo "MEM USE = $percentage % INFO = OK"
      fi
}

DISK_USE(){

	echo "----------------DISK MONITORING--------------------"
	   
	       Disk_Use=$(df -h / | awk 'END{print $5}' |  tr -d '%')
              

               if [ $Disk_Use -gt 80 ]
               then
                     echo "DISK USE = $Disk_Use %  WARNING = DISK HAS REACHED LIMITS !!!"
               else
		     echo " DISK USE = $Disk_Use % INFO OK"  
		     message=$( echo " DISK USE = $Disk_Use % INFO OK")
                     echo -e "Subject: Disk Usage Alert\n\n$message" | msmtp omnagare83@gmail.com

               fi
	             
}

SERVICE_STATUS(){
	echo "-----------------SERVICE MONITORING------------------------"
	services=(nginx sshd mysql)
	for service in "${services[@]}";
        do
	     if systemctl is-active --quiet "$service";
             then
		     echo "$service Is Running"
	     else
		     echo "$service Is Not Running or Installed"
             fi
        done

}

CPU_USE | tee -a system.log
MEM_USE  | tee -a system.log  
DISK_USE | tee -a system.log

SERVICE_STATUS | tee -a system.log

