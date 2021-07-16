#!/usr/bin/env bash

yay -S --needed preload systemd-swap

sudo systemctl enable preload.service

sudo sed -e 's|^.*swapfc_enabled.*$|swapfc_enabled=1|g' \
         -e 's|#swapfc_|swapfc_|g' -i /etc/systemd/swap.conf
sudo systemctl enable systemd-swap.service

exit 0

