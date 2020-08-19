function fish_prompt --description 'Prompt:noisyfish'
  # toshi75   https://github.com/toshi75/noisyfish
  
  # fisher add jethrokuan/z edc/bass jethrokuan/fzf laughedelic/fish_logo #ryotako/fish-vimcolor
    
  # Line 1
    echo '------------------------------------------'

  # Line 2
    set -l USE JP  # JP or not.
    set_color ffff00 ;echo -n 'fish'
    set_color ff9900 ;echo -n "["
    set_color 00ffff ;echo -n (date '+%m')
    set_color ffff00 ;echo -n '/'
    set_color 00ffff ;echo -n (date +%d)
    if [ "$USE" = "JP" ]
                        echo -n (date '+%u' |
                                 sed -e 's|1|㈪|g' \
                                     -e 's|2|㈫|g' \
                                     -e 's|3|㈬|g' \
                                     -e 's|4|㈭|g' \
                                     -e 's|5|㈮|g' \
                                     -e 's|6|㈯|g' \
                                     -e 's|7|㈰|g')
    else
                        echo -n ' '
                        echo -n (date '+%u' |
                                 sed -e 's|1|Mon|g' \
                                     -e 's|2|Tue|g' \
                                     -e 's|3|Wed|g' \
                                     -e 's|4|Thu|g' \
                                     -e 's|5|Fri|g' \
                                     -e 's|6|Sat|g' \
                                     -e 's|7|Sun|g')
    end
                                     echo -n ' '
                        echo -n (date +%H)
    set_color ffff00 ;echo -n ':'
    set_color 00ffff ;echo -n (date +%M)
    set_color ff9900 ;echo -n ']['
    set_color 00ff00 ;echo -n %self
    set_color ff9900 ;echo -n ']['
    set_color ffff00 ;echo -n (df -H (pwd) 2>/dev/null |
                                 sed -n '2p' |
                                 awk '{print $4}' 2>/dev/null)
    set_color ff9900    ;echo -n ']'
    set fish_prompt_pwd_dir_length 0
    set_color ffff00 ;echo    ': '(pwd |
                                     sed -e "s|\/home\/$USER|\$HOME|g" \
                                         -e 's|\/\/|\/|g' \
                                         -e 's|\/$||g')
  # Line 3
    set_color ffff00 ;echo -n '>'
    set_color ff9900 ;echo -n '+'
    set_color 00ffff ;echo -n 'XX'
    set_color 00ff00 ;echo -n '('
    set_color ff9900 ;echo -n '@'    #'^' 'O' '0' '*' 'ϕ' '٭'
    set_color ffff00 ;echo -n '>|'
    set_color normal
end
