function vboxinit
    fisher install patrickf1/colored_man_pages.fish
    fisher install PatrickF1/fzf.fish
    fisher install edc/bass
    fisher install laughedelic/fish_logo
    fisher install jethrokuan/z
    sudo pacman -S --needed --noconfirm noto-fonts-emoji
    sudo groupadd vboxusers
    sudo groupadd vboxfs
    sudo gpasswd -a $USER vboxusers
    sudo gpasswd -a $USER vboxfs
    sudo gpasswd -a $USER storage
    sudo gpasswd -a $USER wheel
    sudo gpasswd -a $USER video
    sudo gpasswd -a $USER disk
    sudo gpasswd -a $USER audio
    mkdir -p $HOME/{dt,dl,pic,dotfiles/{Template,bin},Autosave,shared}
    sudo rmdir /usr/local/bin && sudo ln -s $HOME/dotfiles/bin /usr/local
echo '
XDG_DESKTOP_DIR="$HOME/dt"
XDG_DOWNLOAD_DIR="$HOME/dl"
XDG_TEMPLATES_DIR="$HOME/dotfiles/Template"
XDG_PUBLICSHARE_DIR="$HOME/shared"
XDG_DOCUMENTS_DIR="$HOME/dotfiles"
XDG_MUSIC_DIR="/usr/local/bin"
XDG_PICTURES_DIR="$HOME/pic"
XDG_VIDEOS_DIR="$HOME/Autosave"
' >$HOME/.config/user-dirs.dirs
    sudo pacman -S --noconfirm --needed \
         base-devel git axel xsel xclip \
         pluma pluma-plugins otf-ipafont opendoas
    echo "permit nopass keepenv $USER" >doas.conf
    sudo chown root:root doas.conf
    sudo chmod 600 doas.conf
    sudo mv doas.conf /etc
    echo "$USER ALL=NOPASSWD: ALL" |xsel -bi
    sudo visudo
    git clone http://aur.archlinux.org/yay-bin.git
    git clone http://aur.archlinux.org/paru-bin.git
    cd ./yay-bin
    makepkg -Ccsi
    yay --save --removemake --nodiffmenu --sudoloop
    cd ../paru-bin
    makepkg -Ccsi
    cd ..
    rm -fr ./{yay,paru}-bin
    yay -S neovim neovim-symlinks {yt-dlp,gallery-dl}-git yt-dlp-drop-in
end
