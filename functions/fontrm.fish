function fontrm
    for i in (seq (count $argv))
        if [ "(echo "$argv[$i]" |grep -c -e .ttf\$ -e .ttc\$ -e .otf\$)" -eq 1 ]
            doas mv -b "$argv[$i]" -t /tmp ||
            sudo mv -b "$argv[$i]" -t /tmp
        end
    end
end
