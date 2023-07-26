# Defined in /tmp/fish.OpPOOt/fish_prompt.fish @ line 2
function fish_prompt --description 'prompt'
    # toshi75   https://github.com/toshi75/noisyfish
    # fisher install jethrokuan/z edc/bass jethrokuan/fzf laughedelic/fish_logo patrickf1/colored_man_pages.fish
    # ryotako/fish-vimcolor

  if [ ! -x /usr/bin/fc-list ]
    echo "fc-list: Not found."
    echo "install fontconfig."
  end


  if [ ! -f $HOME/.config/fish/fish_plugins ] ||
     [ (cat $HOME/.config/fish/fish_plugins |wc -l) -le 1 ]
    mkdir -p $HOME/.config/fish
    echo 'toshi75/noisyfish'                 >$HOME/.config/fish/fish_plugins
    echo 'patrickf1/colored_man_pages.fish' >>$HOME/.config/fish/fish_plugins
    echo 'PatrickF1/fzf.fish'               >>$HOME/.config/fish/fish_plugins
    echo 'edc/bass'                         >>$HOME/.config/fish/fish_plugins
    echo 'laughedelic/fish_logo'            >>$HOME/.config/fish/fish_plugins
    echo 'jethrokuan/z'                     >>$HOME/.config/fish/fish_plugins
  end

  # Line 1
    set -l HEAD '-'
    set -l TAIL '-'
    #######################
    set -l N 4 # <-= with "functions/fish_mode_prompt"
    set -l WIDTH (math (tput cols)-(echo -n $HEAD |wc -m))
    echo -n "$HEAD"
    while [ $N -lt $WIDTH ]
  # while [ $N -le $WIDTH ]
        echo -n $TAIL
        set N (math $N+1)
    end
  # printf '\s'
    echo    $TAIL

  # Line 2
    set -l USE MYLOCALE # MYLOCALE or not.
    set_color ff0000 ;echo -n "["
    set_color 00ffff ;echo -n (date '+%m')
    set_color ffff00 ;echo -n '/'
    set_color 00ffff ;echo -n (date '+%'d)
    switch (date '+%u')
        case 5
            set_color ffdd00
        case 7
            set_color ff0000
        case '*'
            set_color 00ffff
    end
    if [ "$USE" = "MYLOCALE" ]
                      echo -n (date '+%'a)
    else
                      set -l TEMP "$LANG"
                      set -l LANG C
                      echo -n (date '+%'a)
                      set -l LANG "$TEMP"
    end
                      echo -n ' '
    set_color 00ffff ;echo -n (date +%H)
    set_color ffff00 ;echo -n ':'
    set_color 00ffff ;echo -n (date +%M)
    set_color ff0000 ;echo -n ']['
  # set_color 00ff00 ;echo -n %self
  # set_color ff0000 ;echo -n ']['
    set_color ffff00 ;echo -n (df -H (pwd) 2>/dev/null |
                                 sed -n '2p' |
                                 awk '{print $4}' 2>/dev/null)
    set_color ff0000    ;echo -n ']'
    set fish_prompt_pwd_dir_length 0
    if [ (fc-list |grep -ci emoji) -gt 0 ]
        set_color ffff00 ;echo    ': '(pwd |
                                         sed -e "s|\/home\/$USER|🏠️|g" \
                                             -e 's|\/\/|\/|g' \
                                             -e 's|\/$||g')
    else
        set_color ffff00 ;echo    ': '(pwd |
                                         sed -e "s|\/home\/$USER|\$HOME|g" \
                                             -e 's|\/\/|\/|g' \
                                             -e 's|\/$||g')
    end
  # Line 3
    set -l ARROW NOTfish
    switch ARROW
        case fish
            set_color ffff00 ;echo -n '>'
            set_color ff0000 ;echo -n '+'
            set_color 00ffff ;switch (math (random)%6)
                                  case 0 1 2
                                      echo -n 'XX'
                                  case 3 4
                                      echo -n '+X'
                                  case 5
                                      echo -n '++'
                              end
            set_color 00ff00 ;echo -n '('
            if [ (date '+%H') -ge 22 ] || [ (date '+%H') -le 6 ]
                set_color ffffff ;switch (math (random)%6)
                                      case 0
                                          echo -n '*'
                                      case 1 2
                                          echo -n '"'
                                      case '*'
                                          echo -n '^'
                                  end
            else
                set_color ff0000 ;switch (math (random)%35)
                                      case 0
                                          echo -n 'ϕ'
                                      case 1 2
                                          echo -n '٭'
                                      case 3 4 5
                                          echo -n '^'
                                      case 6 7 8 9
                                          echo -n '*'
                                      case 10 11 12 13 14
                                          echo -n '"'
                                      case 15 16 17 18 19 20
                                          echo -n '0'
                                      case 21 22 23 24 25 26 27
                                          echo -n 'O'
                                      case '*'
                                          echo -n '@'
                                  end
            end
            set_color ffff00 ;switch (math (random)%3)
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
