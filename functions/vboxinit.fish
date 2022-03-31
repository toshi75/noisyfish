function vboxinit
    cd (pwd)
    fisher update
    fisher install patrickf1/colored_man_pages.fish
    fisher install PatrickF1/fzf.fish
    fisher install edc/bass
    fisher install laughedelic/fish_logo
    fisher install jethrokuan/z
    sudo pacman -Syu
    sudo pacman -S --noconfirm --needed reflector
    sudo reflector --latest 20       \
                   --protocol http   \
                   --protocol https  \
                   --sort rate       \
                   --save /etc/pacman.d/mirrorlist
    sudo pacman -S --noconfirm --needed \
         base-devel git axel xsel xclip noto-fonts-emoji \
         pluma otf-ipafont opendoas docker
    sudo pacman -Rsn --noconfirm --needed \
                virtualbox-guest-utils-nox 2>/dev/null
    sudo pacman -S --noconfirm --needed virtualbox-guest-utils
    echo "permit nopass keepenv $USER" >doas.conf
    sudo chown root:root doas.conf
    sudo chmod 600 doas.conf
    sudo mv doas.conf /etc
    echo "$USER ALL=NOPASSWD: ALL" |xsel -bi

#    sudo groupadd vboxusers
#    sudo groupadd vboxfs
#    sudo gpasswd -a $USER vboxusers
#    sudo gpasswd -a $USER vboxfs
#    sudo gpasswd -a $USER storage
#    sudo gpasswd -a $USER wheel
#    sudo gpasswd -a $USER video
#    sudo gpasswd -a $USER disk
#    sudo gpasswd -a $USER audio
    for i in {vbox{usrs,sf},docker}
        sudo groupadd $i
    end
    for i in {vbox{usrs,sf},docker,wheel,video,audio,disk,storage,docker}
        sudo gpasswd -a $USER $i
    end
    mkdir -p $HOME/{dt,dl,pic,dotfiles/{Template,bin},Autosave,shared}

    sudo rmdir /usr/local/bin &&
    sudo ln -s $HOME/dotfiles/bin /usr/local

#    su
#    set EDITOR pluma ;visudo
#    exit
    git clone http://aur.archlinux.org/yay-bin.git
    git clone http://aur.archlinux.org/paru-bin.git
    cd ./yay-bin
    makepkg -Ccsi --noconfirm
    cd ../paru-bin
    makepkg -Ccsi --noconfirm
    cd ..
    rm -fr ./yay-bin
    rm -fr ./paru-bin
    yay --save --nodiffmenu --removemake \
        --sudo /usr/bin/doas --mflags ' -Cc '

    doas pacman -Rsn --noconfirm --needed \
         vi {,neo}vim yt-dlp \
         wget aria2 yad 2>/dev/null
    yay -S --needed --noconfirm --useask \
        neovim-git neovim-symlinks dein-vim-git
    yay -S --needed --noconfirm --useask \
        {yt-dlp,gallery-dl}-git yt-dlp-drop-in \
        aria2-fast wget{,2}-git pluma-plugins \
        nautilus nautilus-terminal mediainfo \
        libfdk-aac phantomjs-bin openh264 \
        tilix xed nomacs rsync rclone unison p7zip \
        papirus-icon-theme pamac-aur fzf peco gimp \
        inkscape svgo microsoft-edge-stable-bin ocs-url \
        avidemux-{qt,cli} tageditor-cli jdupes-git ripgrep-git \
        fd lsd ttf-delugia-code lumins libxfce4ui-nocsd \
        gtk3-nocsd-legacy-git gedit-menubar gedit-plugins-git \
        editorconfig-gedit-git gedit-smart-home gedit-panel-toggler \
        google-chrome terminator {alacritty,yad}-git \
        asp nautilus-mediainfo
end

