function fish_prompt --description prompt
    # toshi75   https://github.com/toshi75/noisyfish
    # fisher install jethrokuan/z edc/bass jethrokuan/fzf laughedelic/fish_logo patrickf1/colored_man_pages.fish
    # ryotako/fish-vimcolor

    if [ ! -x /usr/bin/fc-list ]
        echo "fc-list: Not found."
        echo "install fontconfig."
    end
    # Line 1
    set -l HEAD '[fish]'
    set -l TAIL -
    # set -l N 4 # <-= with "functions/fish_mode_prompt"
    set -l N 1
    set -l WIDTH (math (tput cols)-(echo -n $HEAD |wc -m))
    echo -n "$HEAD"
    while [ $N -le $WIDTH ]
        echo -n $TAIL
        set N (math $N+1)
    end
    printf '\s'
    # Line 2
    set -l USE NotMYLOCALE # MYLOCALE or not.
    set_color ff0000
    echo -n "["
    set_color 00ffff
    echo -n (date '+%m')
    set_color ffff00
    echo -n /
    set_color 00ffff
    echo -n (date '+%d')
    switch (date '+%u')
        case 1
            set_color ffdd00
        case 2
            # set_color ff4b00
            set_color dc143c
        case 3
            set_color 00ffff
        case 4
            set_color 00ff00
        case 5
            set_color ffff00
        case 6
            set_color 00ffff
        case 7
            set_color dc143c
    end
    if [ "$USE" = MYLOCALE ]
        echo -n (date '+%a')
    else
        #  %u day of week (1..7); 1 is Monday
        switch (date '+%u')
            case 1
                echo -n Mon
            case 2
                echo -n Tue
            case 3
                echo -n Wed
            case 4
                echo -n Thu
            case 5
                echo -n Fri
            case 6
                echo -n Sat
            case 7
                echo -n Sun
        end
    end
    echo -n ' '
    set_color 00ffff
    echo -n (date '+%H')
    set_color ffff00
    echo -n ':'
    set_color 00ffff
    echo -n (date '+%M')
    set_color ff0000
    echo -n ']['
    set_color ffff00
    echo -n (df -h --out='avail' (pwd) 2>/dev/null |tail -n1 |tr -d ' ')
    set_color ff0000
    echo -n ']'
    set fish_prompt_pwd_dir_length 0
    if [ (fc-list |grep -ci emoji) -gt 0 ]
        set_color ffff00
        echo ': 🏠️'(pwd |sed -e "s|$HOME||g" -e 's|\/\/|\/|g' -e 's|\/$||g')
    else
        set_color ffff00
        echo ": \$HOME"(pwd |sed -e "s|$HOME||g" -e 's|\/\/|\/|g' -e 's|\/$||g')
    end
    # Line 3
    set -l ARROW NOTfish # fish / any string
    switch ARROW
        case fish
            set_color ffff00
            echo -n '>'
            set_color ff0000
            echo -n '+'
            set_color 00ffff
            switch (math (random)%6)
                case 0 1 2
                    echo -n XX
                case 3 4
                    echo -n '+X'
                case 5
                    echo -n '++'
            end
            set_color 00ff00
            echo -n '('
            if [ (date '+%H') -ge 22 ] || [ (date '+%H') -le 6 ]
                set_color ffffff
                switch (math (random)%6)
                    case 0
                        echo -n '*'
                    case 1 2
                        echo -n '"'
                    case '*'
                        echo -n '^'
                end
            else
                set_color ff0000
                switch (math (random)%35)
                    case 0
                        echo -n ϕ
                    case 1 2
                        echo -n '٭'
                    case 3 4 5
                        echo -n '^'
                    case 6 7 8 9
                        echo -n '*'
                    case 10 11 12 13 14
                        echo -n '"'
                    case 15 16 17 18 19 20
                        echo -n 0
                    case 21 22 23 24 25 26 27
                        echo -n O
                    case '*'
                        echo -n '@'
                end
            end
            set_color ffff00
            switch (math (random)%3)
                case 0 1
                    echo -n '>|'
                case 2
                    echo -n '=|'
            end
        case '*'
            echo -n '↳|'
    end
    set_color normal
end
