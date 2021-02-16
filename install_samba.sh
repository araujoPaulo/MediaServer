#/bin/bash
set -e

###########################################
# This script will install Samba.         #
# This service implement SMB protocol to  #
# share directories from host to client.  #
###########################################

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Samba: installing..."

# install samba
apt-get install samba samba-common-bin

# set samba configurations
DIR="/mnt/harddrive"
tee -a /etc/samba/smb.conf > /dev/null <<EOT
[mediaserver]
path = ${DIR}
writeable=Yes
create mask=0777
directory mask=0777
public=no
EOT

# set samba user and password
PASSWORD="raspberry"
(echo "${PASSWORD}"; sleep 1; echo "${PASSWORD}" ) | smbpasswd -s -a pi

# restart samba
systemctl restart smbd

echo "Samba: installed!"