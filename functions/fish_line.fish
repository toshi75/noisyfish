function fish_line
    set -l HEAD (echo -n $argv[1] |wc -c)
    set -l ALL (tput cols)
    set -l REPEAT (math "$ALL - $HEAD")
    echo -n $argv[1]
    for i in (seq $REPEAT)
        echo -n $argv[2]
    end |awk 4
end
