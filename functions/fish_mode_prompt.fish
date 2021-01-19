# Defined in /tmp/fish.ZjWNKi/fish_mode_prompt.fish @ line 2
function fish_mode_prompt --description 'Displays the current mode'
    # To reuse the mode indicator use this function instead
    # fish_default_mode_prompt
    switch $fish_bind_mode
        case default
            set_color 00ff00
            echo '[N]'
        case insert
            set_color ffdd00
            echo '[I]'
        case replace_one
            set_color ff0000
            echo '[R]'
        case visual
            set_color 00ffff
            echo '[V]'
        case '*'
            set_color ff00ff
            echo '[?]'
    end
    set_color normal
end
