#!/usr/bin/env bash
sudo su

rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

#preload
systemctl enable preload.service

#systemd-swap
#[ /etc/systemd/swap.conf ]  #swapfc..  <= uncomment
systemctl enable systemd-swap.service

# caps key as ctrl (on xfce)
setxkbmap -option ctrl:nocaps



