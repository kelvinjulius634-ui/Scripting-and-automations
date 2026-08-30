#!/bin/bash
while getopts "s:b:h" lets; do
case $lets in
s) SOURCE="$OPTARG";;
b) BACKUP="$OPTARG";;
h) echo " The way to use : ( -s <source_directory> ) ( -b <backup_directory> ) "
exit 0;;
\?) echo "Invalid flags please enter -h for help"
 exit 1
esac
done
echo ""
if [ ! -d "$BACKUP" ]; then
mkdir -p "$BACKUP" && echo "Backup_directory created" || echo "Failed to create a backup directory"
fi
echo ""
if [ -d "$SOURCE" ] && [ -d "$BACKUP" ]; then
echo "Backup in progress"
else
echo "Can not continue with backup, please ensure backup_directory and Source_directory exists"
exit 1
fi
echo ""
timestamp=$(date +%d%m%Y_%H%M%S)
backupfile="DataStore_${timestamp}.tar.gz"
tar -czf "$BACKUP/$backupfile" "$SOURCE"
if [ $? -eq 0 ]; then
echo "Backup Process completed successfully"
echo " INFO:: Visit at {$BACKUP/$backupfile}  to see your data "
else
echo " ERROR : Backup failed to complete "
fi
