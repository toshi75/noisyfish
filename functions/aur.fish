function aur
    if [ ! -f /tmp/HELPER.flag ]
        sudo pacman -S --needed --noconfirm base-devel git &&
        touch /tmp/HELPER.flag
    end
    set DIR (pwd)
    set WD (mktemp -d)
    trap "/usr/bin/rm -fr $WD" 0 1 2 3 15

    for i in (seq (count $argv))
        cd $WD
        git clone "https://aur.archlinux.org/$argv[$i].git"
        cd ./$argv[$i]
        makepkg --printsrcinfo >./.SRCINFO 
        makepkg -Ccsi --needed --noconfirm --skipchecksums --skippgpcheck
    end
    cd $DIR
    return 0

end
