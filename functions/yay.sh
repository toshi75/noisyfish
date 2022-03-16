#!/usr/bin/env bash
if ( type yay &>/dev/null ) ;then
    yay $*
else
    if ( type reflector &>/dev/null ) ;then
        :
    else
        sudo pacman -S --needed --noconfirm reflector
        sudo reflector --latest 20 -p http -p https \
                       --sort rate --save /etc/pacman.d/mirrorlist
    fi
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay-bin.git
    cd ./yay-bin
    makepkg -Ccsi
    cd ..
    /usr/bin/rm -fr ./yay-bin
    yay --save --sudoloop --removemake --nodiffmenu \
        --useask --mflags " -Cc --needed "
fi

