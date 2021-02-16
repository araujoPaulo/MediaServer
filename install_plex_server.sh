#/bin/bash
set -e

#################################################
# This script will install Plex Media Server.   #
# Plex is a service that allow stream your      #
# movies, musics and photos from the central    #
# server to a client                            #
#################################################

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Plex Media Server: installing..."

# allow package manager to retrieve packages over the https
apt-get install apt-transport-https -y

# add plex repository
curl https://downloads.plex.tv/plex-keys/PlexSign.key | apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | tee /etc/apt/sources.list.d/plexmediaserver.list

# update package list
apt-get update

# install Plex Media Server
apt install plexmediaserver -y

# create media folders
DIR="/mnt/harddrive"
if [ -d "$DIR" ]; then
  # create media folders in default location
  mkdir ${DIR}/movies
  mkdir ${DIR}/series
  mkdir ${DIR}/musics
  mkdir ${DIR}/photos
else
  echo "Warning: ${DIR} not found. Can not create media folders in default location."
fi

echo "Plex Media Server: installed!"