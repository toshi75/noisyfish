function get-fisher
    sudo pacman -S --needed --noconfirm curl
    curl -qkLSs https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish |
    source && fisher install jorgebucaran/fisher
    mkdir -p $HOME/.config/fish
    echo 'toshi75/noisyfish'                 >$HOME/.config/fish/fish_plugins
    echo 'patrickf1/colored_man_pages.fish' >>$HOME/.config/fish/fish_plugins
    echo 'PatrickF1/fzf.fish'               >>$HOME/.config/fish/fish_plugins
    echo 'edc/bass'                         >>$HOME/.config/fish/fish_plugins
    echo 'laughedelic/fish_logo'            >>$HOME/.config/fish/fish_plugins
    echo 'jethrokuan/z'                     >>$HOME/.config/fish/fish_plugins
    echo                                    >>$HOME/.config/fish/fish_plugins
    return 0
end
