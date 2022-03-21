function yg
    which paru &>/dev/null
    if [ $status ]
        set -l APP /usr/bin/paru
    else
        set -l APP /usr/bin/yay
    end
    switch (count $argv)
        case 0
            xsel -bo |awk 4 |
            while read i
                $APP -G $i
            end
        case '*'
            for i in (seq (count $argv))
                $APP -G $argv[$i]
            end
    end
    return 0
end
