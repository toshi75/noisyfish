function chaoup
    if [ ! -x /usr/bin/doas ] || [ ! -f /etc/doas.conf ]
        sudo pacman -S --needed --noconfirm opendoas
        echo "permit nopass keepenv $USER" >/tmp/doas.conf
        sudo mv -f /tmp/doas.conf -t /etc
        sudo chown root:root /etc/doas.conf
        sudo chmod 600 /etc/doas.conf
    end
    pacman -Qi chaotic-keyring &>/dev/null
    if [ $status -gt 0 ]
        doas pacman -S --needed --noconfirm powerpill
        doas pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
        doas pacman-key --lsign-key FBA220DFC880C036
        doas pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
                                            'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
        if [ $(cat /etc/pacman.conf |grep -c "chaotic-aur") -eq 0 ]
            cp /etc/pacman.conf -t /tmp
            echo '[chaotic-aur]' >>/tmp/pacman.conf
            echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >>/tmp/pacman.conf
            sed -e 's|#Color|Color|g' -e 's|#Para|Para|g' -i /tmp/pacman.conf
            doas mv -f /tmp/pacman.conf -t /etc
        end
        if [ ! -x /usr/bin/paru ]
            set -l WD (mktemp)
            set -l DIR (pwd)
            cd $WD
            git clone https://aur.archlinux.org/paru-bin
            cd $WD/paru-bin
            makepkg -Ccsi
            cd $DIR
            rm -fr $WD
            mkdir -p $HOME/.config/paru
            echo '[options]'                >>$HOME/.config/paru/paru.conf
            echo 'BottomUp'                 >>$HOME/.config/paru/paru.conf
            echo 'CleanAfter'               >>$HOME/.config/paru/paru.conf
            echo 'PgpFetch'                 >>$HOME/.config/paru/paru.conf
            echo 'RemoveMake'               >>$HOME/.config/paru/paru.conf
            echo 'SortBy = popularity'      >>$HOME/.config/paru/paru.conf
            echo 'CompletionInterval = 3'   >>$HOME/.config/paru/paru.conf
            echo 'NoWarn = *'               >>$HOME/.config/paru/paru.conf
            echo 'SkipReview'               >>$HOME/.config/paru/paru.conf
            echo '[bin]'                    >>$HOME/.config/paru/paru.conf
            echo "MFlags = ' -Cc  '"        >>$HOME/.config/paru/paru.conf
            if [ -x /usr/bin/doas ]
                echo 'Sudo = /usr/bin/doas' >>$HOME/.config/paru/paru.conf
            end
        end
    end
    doas pacman -Sy && doas powerpill -Su && paru -Su
    return 0
end
