function bt
    if [ ! -f $PWD/0-bt ]
        source $HOME/.config/user-dirs.dirs
        cp $XDG_TEMPLATES_DIR/0-bt -t $PWD
        doas chmod 755 $PWD/0-bt
    end
    $PWD/0-bt
end
