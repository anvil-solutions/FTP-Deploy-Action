#!/bin/sh

# "to avoid continuing when errors or undefined variables are present"
set -eu

echo "Starting FTP Deploy"

WDEFAULT_LOCAL_DIR=${6:-"."}
WDEFAULT_REMOTE_DIR=${7:-"."}
WDEFAULT_METHOD=${4:-"ftp"}

if [ $WDEFAULT_METHOD = "sftp" ]; then
  WDEFAULT_PORT=${5:-"22"}
  echo "Establishing SFTP connection..."
  sshpass -p $3 sftp -o StrictHostKeyChecking=no -P $WDEFAULT_PORT $2@$1
  echo "Connection established"
else
  WDEFAULT_PORT=${5:-"21"}
fi;

echo "Using $WDEFAULT_METHOD to connect to port $WDEFAULT_PORT"

echo "Uploading files..."
lftp $WDEFAULT_METHOD://$1:$WDEFAULT_PORT -u $2,$3 -e "set ftp:ssl-allow no; mirror -R -P 10 -e $WDEFAULT_LOCAL_DIR $WDEFAULT_REMOTE_DIR; quit"

echo "FTP Deploy Complete"
exit 0
