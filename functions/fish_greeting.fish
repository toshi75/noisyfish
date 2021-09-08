function fish_greeting
    if [ -f "$HOME/.config/fish/fisher_update.log" ] ||
       [ -f "$HOME/.config/fish/completions.log"   ] 
        auto_update
    end
    reset
    type fish_logo &>/dev/null
    if [ $status -eq 0 ]
        fish_logo
    end
end
