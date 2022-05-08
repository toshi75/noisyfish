function _LINE
    set -l HEAD (echo -n $argv[1] |wc -c)
    set -l ALL  (tput cols)
    set -l REPEAT (math "$ALL - $HEAD")
    switch (count $argv)
        case 1
            set -l HEADCOUNT (echo -n $argv[1] |wc -c)
            set -l ALLCOUNT  (tput cols)
            set -l REPEATCOUNT (math "($ALLCOUNT - $HEADCOUNT) / $HEADCOUNT")
            set -l _COUNT 1
            echo -n "$argv[1]"
            while [ $_COUNT -le $REPEATCOUNT ]
                echo -n $argv[1]
                set _COUNT (math "$_COUNT + 1")
            end |awk 4
        case 2
            set -l HEADCOUNT (echo -n $argv[1] |wc -c)
            set -l BODYCOUNT (echo -n $argv[2] |wc -c)
            set -l ALLCOUNT  (tput cols)
            set -l REPEATCOUNT (math "($ALLCOUNT - $HEADCOUNT) / $BODYCOUNT")
            set -l _COUNT 1
            echo -n "$argv[1]"
            while [ $_COUNT -le $REPEATCOUNT ]
                echo -n $argv[2]
                set _COUNT (math "$_COUNT + 1")
            end |awk 4
        case 3
            set -l HEADCOUNT (echo -n $argv[1] |wc -c)
            set -l BODYCOUNT (echo -n $argv[2] |wc -c)
            set -l TAILCOUNT (echo -n $argv[3] |wc -c)
            set -l ALLCOUNT  (tput cols)
            set -l REPEATCOUNT (math "($ALLCOUNT - $HEADCOUNT - $TAILCOUNT) / $BODYCOUNT")
            set -l _COUNT 1
            echo -n "$argv[1]"
            while [ $_COUNT -le $REPEATCOUNT ]
                echo -n $argv[2]
                set _COUNT (math "$_COUNT + 1")
            end
            echo "$argv[3]"
    end
end
