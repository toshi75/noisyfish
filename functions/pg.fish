function pg
    if [ (count $argv) -eq 0 ]
        paru -G (xsel -bo)
    else
        paru -G $argv
    end
end
