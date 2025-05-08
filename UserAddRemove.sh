#!/bin/bash


CSV_FILE='users.csv'
LogFile='/home/omnagare/useraddremove.log'
DEFAULT_PASSWORD="Weclome"


log(){
	echo "$(date '+%F %T') - $1" | tee -a "$LogFile"
}

if [ ! -f "$CSV_FILE" ]
then
	echo "The File Dosent Exist..with Name $CSV_FILE"
	exit 1
else
	echo "*************File Exist..Processing Further*****************"
fi


while IFS=',' read -r action username fullname; do
	[[ "$username" == "username" ]] && continue
	[[ -z "$action" || -z "$username" ]] && {
	         log "WARN: The User and Action is Empty....For This"
	         continue
	}



	if [[ "$action" == "add" ]]; then
		if getent passwd "$username" > /dev/null; then
			log "INFO: User $username Already Exists...Skipping."
		else
			useradd -m -c "$fullname" "$username"
			echo "$username:$DEFAULT_PASSWORD" | chpasswd
			chage -d 0 "$username" 
			log "ADDED: User $username ($fullname) with Default Passwd"
		fi
	elif [[ "$action" == "remove" ]]; then
		if getent passwd "$username" > /dev/null; then
			userdel -r $username
			log "INFO: User Is Deleted $username"
		else
			log "Warn: User $username Dosen't Exist"
		fi
	else
		log "ERROR: Unknown Action '$action' for User $username"
	fi
done < "$CSV_FILE"
