function fish_prompt --description 'Prompt:noisyfish'
  # toshi75   https://github.com/toshi75/noisyfish
  # Line 1
    echo '------------------------------------------'

  # Line 2
    set_color brred    ;echo -n "["
    set_color brcyan   ;echo -n (date '+%m')
    set_color bryellow ;echo -n '/'
    set_color brcyan   ;echo -n (date +%d)
                        echo -n ' '
                        echo -n (date '+%u' |
                                 sed -e 's|1|Mon|g' \
                                     -e 's|2|Tue|g' \
                                     -e 's|3|Wed|g' \
                                     -e 's|4|Thu|g' \
                                     -e 's|5|Fri|g' \
                                     -e 's|6|Sat|g' \
                                     -e 's|7|Sun|g')
                        echo -n ' '
                        echo -n (date +%H)
    set_color bryellow ;echo -n ':'
    set_color brcyan   ;echo -n (date +%M)
    set_color brred    ;echo -n ']['
    set_color brgreen  ;echo -n %self
    set_color brred    ;echo -n ']['
    set_color bryellow ;echo -n (df -H (pwd) 2>/dev/null |
                                 sed -n '2p' |
                                 awk '{print $4}' 2>/dev/null)
    set_color brred    ;echo -n ']'
    set fish_prompt_pwd_dir_length 0
    set_color brwhite  ;echo    ': '(pwd |
                                     sed -e "s|\/home\/$USER|\$HOME|g" \
                                         -e 's|\/\/|\/|g' \
                                         -e 's|\/$||g')
  # Line 3
    set_color bryellow ;echo -n '>'
    set_color brred    ;echo -n '+'
    set_color brcyan   ;echo -n 'XX'
    set_color brgreen  ;echo -n '('
    set_color brred    ;echo -n '@'    #'^' 'O' '0' '*' 'ϕ' '٭'
    set_color bryellow ;echo -n '>|'
    set_color normal
end
