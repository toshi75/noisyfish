function set-dirs
    mkdir -p $HOME/dl
    mkdir -p $HOME/dt
    mkdir -p $HOME/pic
    mkdir -p $HOME/shared
    mkdir -p $HOME/Autosave
    mkdir -p $HOME/dotfiles/Template

    echo 'XDG_DESKTOP_DIR="$HOME/dt"'                   >$HOME/.config/user-dirs.dirs
    echo 'XDG_DOWNLOAD_DIR="$HOME/dl"'                 >>$HOME/.config/user-dirs.dirs
    echo 'XDG_TEMPLATES_DIR="$HOME/dotfiles/Template"' >>$HOME/.config/user-dirs.dirs
    echo 'XDG_PUBLICSHARE_DIR="$HOME/shared"'          >>$HOME/.config/user-dirs.dirs
    echo 'XDG_DOCUMENTS_DIR="$HOME/dotfiles"'          >>$HOME/.config/user-dirs.dirs
    echo 'XDG_MUSIC_DIR="/usr/local/bin"'              >>$HOME/.config/user-dirs.dirs
    echo 'XDG_PICTURES_DIR="$HOME/pic"'                >>$HOME/.config/user-dirs.dirs
    echo 'XDG_VIDEOS_DIR="$HOME/Autosave"'             >>$HOME/.config/user-dirs.dirs
    echo ''                                            >>$HOME/.config/user-dirs.dirs
    return 0
end
