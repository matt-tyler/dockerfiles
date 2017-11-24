#!/bin/bash

container=flash/spacemacs
name=spacemacs

if [[ $(docker ps -af "name=$name" --format '{{.Names}}') == $name ]]; then
  docker restart spacemacs
else
  docker run -d \
   --name $name \
   -e UNAME=$USER \
   -e UID=$UID \
   -e DISPLAY="unix$DISPLAY" \
   -e TZ=Australia/Perth \
   -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
   -v /etc/localtime:/etc/localtime:ro \
   -v /etc/machine-id:/etc/machine-id:ro \
   -v /var/run/dbus:/var/run/dbus \
   -v ~:/mnt/workspace \
   $container
fi
