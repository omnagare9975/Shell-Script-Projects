#!/bin/bash


LOG_FILE='/home/omnagare/useraddremove.log'
CSV_FILE='users.csv'
DEFAULT_PASS='omnagare'


if [ ! -f "$CSV_FILE" ]; then
	echo "File Name $CSV_FILE is Not Present"
	exit 1
fi


log(){
	echo "$(date '+%F %T') - $1" | tee -a "$LOG_FILE"
}


while IFS=',' read -r action username fullname; do
	[[ "$username" == "username" ]] && continue

	[[ -z "$action" || -z "username" ]] && {
		log "INFO: Actions And Username Field Is Empty"
	        continue
	}


	if [ "$action" == "add" ]; then
		if getent passwd $username > /dev/null ; then
			log "WARNING: User With username $username Already Exist"
		else
			useradd -m -c "$fullname" "$username"
			echo "$username:$DEFAULT_PASS" | chpasswd
			chage -d 0 $username
			log "INFO: User with Username $username Is Created with Default pass"
		fi

       elif [ "$action" == "remove" ]; then
	       if  getent passwd $username > /dev/null ; then
		       userdel -r $username
		       log "INFO: User Has Benn Remove Completly with Data"
               else
		       log "WARNING: USER with Username $username dosen't Exist"
               fi

       else
	      log "WAR: Specified Actions Dosent Exist For User"
       fi

done < "$CSV_FILE"



