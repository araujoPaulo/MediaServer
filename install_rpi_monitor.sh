#/bin/bash
set -e

###########################################
# This script will install RPi Monitor.   #
# This is a web page that you provide a   #
# simple way to check system information. #
###########################################

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "RPi Monitor: installing..."

# install public key to repository
apt-get install dirmngr -y
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 43A579636E330A99A8336C14E4E362DE2C0D3C0F

# get apt source
wget https://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list

# update package information
apt-get update

# install RPi Monitor
apt-get install rpimonitor -y

# update RPi Monitor information
/etc/init.d/rpimonitor update

echo "RPi Monitor: installed!"