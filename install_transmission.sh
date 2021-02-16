#/bin/bash
set -e

###########################################
# This script will install Transmission.  #
# This is a lightweight solution for      #
# torrenting.                             #
###########################################

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Transmission: installing..."

#install transmission
apt install transmission-daemon -y 

# stop transmission
systemctl stop transmission-daemon

# create media folders
DIR="/mnt/harddrive"
if [ -d "$DIR" ]; then
    # create download folders in default location
    mkdir ${DIR}/torrent-inprogress
    mkdir ${DIR}/torrent-complete

    # change transmission configuration
    FORMATED_DIR=$(echo "$DIR" | sed -r 's/\//\\\//g')
    sed -i "s/\"incomplete-dir\":.*/\"incomplete-dir\": \"${FORMATED_DIR}\/torrent-inprogress\",/g" /etc/transmission-daemon/settings.json
    sed -i "s/\"download-dir\":.*/\"download-dir\": \"${FORMATED_DIR}\/torrent-complete\",/g" /etc/transmission-daemon/settings.json
    sed -i "s/\"incomplete-dir-enabled\":.*/\"incomplete-dir-enabled\": true,/g" /etc/transmission-daemon/settings.json
else
    echo "Warning: ${DIR} not found. Can not create download folders in default location."
fi

# setup rpc
sed -i 's/"rpc-password":.*/"rpc-password": "raspberry",/g' /etc/transmission-daemon/settings.json
sed -i 's/"rpc-username":.*/"rpc-username": "pi",/g' /etc/transmission-daemon/settings.json
sed -i 's/"rpc-whitelist":.*/"rpc-whitelist": "192.168.*.*",/g' /etc/transmission-daemon/settings.json
sed -i 's/"umask":.*/"umask": 2,/g' /etc/transmission-daemon/settings.json

# reload daemon
systemctl daemon-reload

# start transmission
systemctl start transmission-daemon

echo "Transmission: installed!"