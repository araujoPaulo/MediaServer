# Media Server
This project provide a shell script based setup with all you need to get a home media server with a Raspberry PI, to keep all you movies, series, photos and music centralized.

### All you need is:
- Raspberry PI
- Power supply for Raspberry PI
- External storage device (eg: HDD) (optional)
- Power supply external storage (optional)

### Steps:
1. configure external storage
2. installation RPi Monitor
3. installation Plex Server
4. installation Transmission
5. installation Samba

## External Storage
It's important a media server has sufficient storage to keep all your favourite movies, series ,photos and music in the same place.

So, you must connect an external storage device tou your Raspberry PI with storage enough to keep your data.

You can have more information [here](https://www.makeuseof.com/tag/connect-hdd-raspberry-pi/).

## RPi Monitor
![RPi Monitor logo](./images/rpi_monitor.png "RPi Monitor logo")

RPi Monitor is a web-based application, allow monitoring all important information that you want from your Raspberry PI (CPU, RAM, etc).

This application provide a base template with pre-configured metrics. However, you can totally change this template. You can add new metrics, edit and/or remove existing ones.

You can have more information [here](https://github.com/XavierBerger/RPi-Monitor).

## Plex Media Server
![Plex logo](./images/plex.png "Plex logo")

Plex Media Server is a media files manager that allow centralize all your media files in one place and you can access them by any client device.

Server stream files content directly to the client. You can have multiple clients connect to server, what means you don't need have multiple copies of the same file across your devices.

The interface of server is web-based, what is perfect to be installed in servers without screen.

You can have more information [here](https://pimylifeup.com/raspberry-pi-plex-server/).

## Transmission
![Transmission logo](./images/transmission.png "Transmission logo")

Transmission is one of the best torrent client.
Is a ligthweigth application, what is perfect to execute in machines with few resources.

Transmission has the possibility to enable the web-based interface.

You can have more information [here](https://pimylifeup.com/raspberry-pi-transmission/).

## Samba
Samba is a good solution to share directories of your server with the other devices, using SMB/CIFS protocol.

This service allows a Linux server share directories with other Linux, Windows or other devices.

You can push or pull files easily from the server using your file manager.

You can have more information [here](https://pimylifeup.com/raspberry-pi-samba/).
