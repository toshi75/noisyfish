function set-group
    doas gpasswd -a $USER wheel
    doas gpasswd -a $USER audio
    doas gpasswd -a $USER disk
    doas gpasswd -a $USER storage
    doas gpasswd -a $USER video
    if [ pacman -Qi virtualbox-guest-utils-nox &>/dev/null ] ||
       [ pacman -Qi virtualbox-guest-utils     &>/dev/null ]
        doas groupadd vboxusers
        doas gpasswd -a $USER vboxusers
        doas gpasswd -a $USER vboxsf
    end
    return 0
end

