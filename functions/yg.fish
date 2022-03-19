function yg
    if [ (count $argv) -eq 0 ]
        yay -G (xsel -bo)
    else
        yay -G $argv
    end
end
