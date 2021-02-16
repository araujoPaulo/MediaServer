#!/bin/bash
set -e

###########################################
# This script will setup a external drive #
# to expand the file system memory.       #
###########################################

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Hard Drive: installing..."

# install ntfs file system reader
apt install ntfs-3g -y

# get drive UUID
UUID=$(blkid /dev/sda1 | cut -d' ' -f3 | cut -d'=' -f2 | cut -d'"' -f2)
echo "Hard Drive: UUID=${UUID}"

if [ -d "$DIR" ] && [ "$(ls -A $DIR)" ]; then
  echo "Hard Drive: installed!"
else
  # create mount directory
  DIR="/mnt/harddrive"
  if [ ! -d "$DIR" ]; then
    mkdir ${DIR}
    chmod 777 ${DIR}
  fi

  # mount drive
  mount -t ntfs-3g -o uid=1000,gid=1000,umask=007 /dev/sda1 ${DIR}

  # backup fstab
  cp /etc/fstab /etc/fstab.backup

  # add drive to be mount on boot
  echo "UUID=${UUID} ${DIR} ntfs-3g uid=1000,gid=1000,nofail,umask=000 0 0" >> /etc/fstab

  echo "Hard Drive: installed!"
fi