#!/usr/bin/env bash

mkdir -p $HOME/{dt,dl,dotfiles/template,shared,pic,Autosave}

cat <<- '__DIRS' > "$HOME/.config/user-dirs.dirs"
XDG_DESKTOP_DIR="$HOME/dt"
XDG_DOWNLOAD_DIR="$HOME/dl"
XDG_TEMPLATES_DIR="$HOME/dotfiles/template"
XDG_PUBLICSHARE_DIR="$HOME/shared"
XDG_DOCUMENTS_DIR="$HOME/dotfiles"
XDG_MUSIC_DIR="/usr"
XDG_PICTURES_DIR="$HOME/pic"
XDG_VIDEOS_DIR="$HOME/Autosave"
__DIRS

