function auto_update
    if [ ! -f "$HOME/.config/fish/fisher_update.log" ]
        fisher update
        date '+%s' >"$HOME/.config/fish/fisher_update.log"
    else
        set -l NOW (date '+%s')
        if [ (math $NOW - (cat "$HOME/.config/fish/fisher_update.log")) -gt (math 3600 x 24 x 3) ]
            fisher update
            date '+%s' >"$HOME/.config/fish/fisher_update.log"
        end
    end

    if [ ! -f "$HOME/.config/fish/completions.log" ]
        fish_update_completions
        date '+%s' >"$HOME/.config/fish/fisher_update.log"
    else
        set -l NOW (date '+%s')
        if [ (math $NOW - (cat "$HOME/.config/fish/completions.log")) -gt (math 3600 x 24 x 7) ]
            fish_update_completions
            date '+%s' >"$HOME/.config/fish/completions.log"
        end
    end
    return 0
end
