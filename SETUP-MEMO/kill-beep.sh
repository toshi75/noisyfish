#!/bin/bash
sudo su
rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf


