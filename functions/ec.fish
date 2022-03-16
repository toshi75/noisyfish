function ec
    if [ (count $argv) -eq 1 ]
        nvim (which $argv[1]) ||
        xdg-open (which $argv[1])
    else
        if [ "$(echo $argv[1] |
             grep -e nvim -e vim -e vi \
                  -e gedit -e pluma -e xed)" != "" ]
            set -l Editor $argv[1]
            for i in (seq 2 (count $argv))
                $argv[1] (which $argv[$i])
            end
        else
            for i in (seq (count $argv))
                xdg-open (which $argv[$i])
            end
        end
    end
    return 0
end
