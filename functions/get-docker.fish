function get-docker
    doas pacman -S --needed --noconfirm docker
    doas gpasswd -a $USER docker
    doas systemctl enable --now docker.service
    return 0
end
