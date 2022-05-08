function add-chaotic-aur
    # https://github.com/chaotic-aur
    sudo pacman-key --recv-key  FBA220DFC880C036 \
                    --keyserver keyserver.ubuntu.com
    sudo pacman-key --lsign-key FBA220DFC880C036
    sudo pacman -U "https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst" \
                   "https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst"

    if [ (grep -c "chaotic-aur" /etc/pacman.conf) -eq 0 ]
        cp /etc/pacman.conf -t /tmp
        echo '[chaotic-aur]'                              >>/tmp/pacman.conf
        echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >>/tmp/pacman.conf
        sudo mv -f /tmp/pacman.conf -t /etc
    end
end


