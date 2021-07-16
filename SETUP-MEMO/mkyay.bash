#!/usr/bin/env bash

[ type git &>/dev/null ] || sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -Ccis

