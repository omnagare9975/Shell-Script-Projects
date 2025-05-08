#!/bin/bash



echo " Zip The code"


if [ $# -eq 0 ];
then
	echo " For The Ziping the File Enter :- zip -r pathofbackupfile/backup/file  sourceofbackupfile "
        exit 1
fi

BackupDIR=$1
SourceDIR=$2
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="/home/omnagare/ShellScript/backup.log"

echo "*****Backup Has Benn Started****"  | tee -a  "$LOGFILE" 

zip -j "$BackupDIR/backup_$timestamp.zip" "$SourceDIR" 

if [ $? -eq 0 ];
then
	echo "Zip has Been Successful for Time $timestamp" | tee -a "$LOGFILE"
else
	echo "Zip Has Failed" | tee -a "$LOGFILE"
fi

