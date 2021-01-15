function fish_prompt --description 'Prompt:noisyfish'
  # toshi75   https://github.com/toshi75/noisyfish

  # fisher add jethrokuan/z edc/bass jethrokuan/fzf laughedelic/fish_logo #ryotako/fish-vimcolor

  # Line 1
    set -l HEAD '=== fish '
    set -l TAIL '='
    #######################
    set -l N 1
    set -l WIDTH (math (tput cols)-(echo -n $HEAD |wc -m))
    echo -n "$HEAD"
    while [ $N -lt $WIDTH ]
        echo -n $TAIL
        set N (math $N+1)
    end
        echo    $TAIL

  # Line 2
    set -l USE MYLOCALE # MYLOCALE or not.
    set_color ff0000 ;echo -n "["
    set_color 00ffff ;echo -n (date '+%m')
    set_color ffff00 ;echo -n '/'
    set_color 00ffff ;echo -n (date +%d)
    switch (date '+%u')
        case 5
            set_color ffdd00
        case 7
            set_color ff0000
        case '*'
            set_color 00ffff
    end
    if [ "$USE" = "MYLOCALE" ]
                      echo -n (date '+%a')
    else
                      set -l TEMP "$LANG"
                      set -l LANG C
                      echo -n (date '+%a')
                      set -l LANG "$TEMP"
    end
                      echo -n ' '
    set_color 00ffff ;echo -n (date +%H)
    set_color ffff00 ;echo -n ':'
    set_color 00ffff ;echo -n (date +%M)
    set_color ff0000 ;echo -n ']['
    set_color 00ff00 ;echo -n %self
    set_color ff0000 ;echo -n ']['
    set_color ffff00 ;echo -n (df -H (pwd) 2>/dev/null |
                                 sed -n '2p' |
                                 awk '{print $4}' 2>/dev/null)
    set_color ff0000    ;echo -n ']'
    set fish_prompt_pwd_dir_length 0
    set_color ffff00 ;echo    ': '(pwd |
                                     sed -e "s|\/home\/$USER|\$HOME|g" \
                                         -e 's|\/\/|\/|g' \
                                         -e 's|\/$||g')
  # Line 3
    set_color ffff00 ;echo -n '>'
    set_color ff0000 ;echo -n '+'
    set_color 00ffff ;echo -n 'XX'
    set_color 00ff00 ;echo -n '('
    set_color ff0000 ;echo -n '@'    #'^' 'O' '0' '*' 'ϕ' '٭'
    set_color ffff00 ;echo -n '>|'
    set_color normal
end
