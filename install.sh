#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# update system
apt-get update
apt-get upgrade -y

# install hard drive
./install_hard_drive.sh

# install RPi Monitor
./install_rpi_monitor.sh

# install Plex Media Server
./install_plex_server.sh

# install Transmission
./install_transmission.sh

# install Samba
./install_samba.sh