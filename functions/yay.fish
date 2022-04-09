function yay
    type yay &>/dev/null
    if [ $status -eq 0 ]
        /usr/bin/yay $argv
    else
        type reflector &>/dev/null
        if [ $status -ne 0 ]
            sudo pacman -S --needed --noconfirm base-devel reflector
            sudo reflector --latest 20 -p http -p https \
                --sort rate --save /etc/pacman.d/mirrorlist
        end
        sudo pacman -S --needed --noconfirm base-devel git
        git clone https://aur.archlinux.org/yay-bin.git
        cd (pwd)/yay-bin
        makepkg -printsrcinfo >.SRCINFO
        makepkg -Ccsi
        cd ..
        /usr/bin/rm -fr ./yay-bin
        yay --save --removemake --nodiffmenu \
            --useask --mflags " -Cc "
    end
end
