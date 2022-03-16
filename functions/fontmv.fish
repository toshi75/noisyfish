function fontmv
    for i in (seq (count $argv))
        if [ "(echo "$argv[$i]" |grep -c -e .ttf\$ -e .ttc\$)" -gt 0 ]
            if [ -d /usr/share/fonts/TTF ]
                doas mv -i "$argv[$i]" -t /usr/share/fonts/TTF
            else
                doas mv -i "$argv[$i]" -t /usr/share/fonts
            end
        elseif [ "(echo "$argv[$i]" |grep -c .otf\$)" -gt 0 ]
            if [ -d /usr/share/fonts/OTF ]
                doas mv -i "$argv[$i]" -t /usr/share/fonts/OTF
            else
                doas mv -i "$argv[$i]" -t /usr/share/fonts
            end
        else
            echo "Unknown input."
        end
    end
    fc-cache -r
end

