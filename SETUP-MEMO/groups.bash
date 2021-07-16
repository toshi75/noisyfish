#!/usr/bin/env bash

sudo groupadd vboxusers
sudo groupadd vboxsf
sudo gpasswd -a $USER vboxusers
sudo gpasswd -a $USER vboxsf
sudo gpasswd -a $USER wheel
sudo gpasswd -a $USER disk
sudo gpasswd -a $USER storage
sudo gpasswd -a $USER video
sudo gpasswd -a $USER audio
if (type docker &>/dev/null) ;then
    sudo gpasswd -a $USER docker
fi



