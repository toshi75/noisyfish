function fish_greeting
    reset
    type fish_logo &>/dev/null
    if [ $status -eq 0 ]
        fish_logo
    end
end
