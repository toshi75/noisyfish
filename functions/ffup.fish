function ffup
    set DIR (pwd)
    cd $HOME/dotfiles/apup/ffmpeg-nocuda-git-with-aur-patch
    ls -1A ./*.pkg.tar.zst &>/dev/null
    if test $status
        trash-put *.pkg.tar.zst 2> /dev/null
    end
    makepkg --printsrcinfo >.SRCINFO
    makepkg -Ccis --noconfirm
    cd $HOME/dotfiles/apup/mpv-full-git-nocuda-nowayland
    ls -1A ./*.pkg.tar.zst &>/dev/null
    if test $status
        trash-put *.pkg.tar.zst 2>/dev/null
    end
    makepkg --printsrcinfo >.SRCINFO
    makepkg -Ccis --noconfirm
    cd $DIR
    /usr/local/bin/fix-desktop-files
    return 0
end
