function install-doas
         yay    -S --noconfirm opendoas ||
    sudo pacman -S --noconfirm opendoas
    echo "permit nopass keepenv {$USER}" >"/tmp/doas.conf"
    sudo chown root:root "/tmp/doas.conf"
    sudo mv "/tmp/doas.conf" -t "/etc"
end
