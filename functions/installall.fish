function installall
    if [ $argv[1] = "-h" || $argv[1] = "--help" ]
        echo "Usage:"
        echo "installall textfile"
        echo "text: 1line-1pkg"
        return 100
    end
    pacman -Qi paru &>/dev/null
    if [ $status -eq 0 ]
        set -l APP paru
    else
        pacman -Qi yay  &>/dev/null
        if [ $status -eq 0 ]
            set -l APP yay
        else
            echo "Need AUR helper, yay or paru."
            return 99
        end
    end

    set -l TT0 (mktemp)
    set -l TT1 (mktemp)
    trap 'rm $TT{0,1} &>/dev/null' 0 1 2 3 15
    cd (pwd)
    cat "$1" >$TT0
    while true
        cat $TT0 |
        sed -e 's|#.*$||g' -e 's|\s||g' |
        sort -u |
        sed '/^$/d' |
        awk 4 |
        while read i
            echo -n "$i  "
        end |awk 4 >$TT1
        rm $TT0
        $APP -S --needed (cat $TT1)
        set -l TT0 (mktemp)
        cat $TT1 |
        sed -e 's|\s|\n|g' |
        awk '!x[$0]++' |
        sed '/^$/d'    |
        while read i
            pacman -Qi $i &>/dev/null
            if [ $status -ne 0 ]
                echo "$i"
            end
        end >$TT0
        if [ (cat $TT0 |wc -l) -gt 0 ]
            echo "These apps not installed."
            echo "#########################"
            cat  $TT0
            echo "#########################"
            while true
                read -p 'Retry install? Y/n >' $ANS
                switch $ANS
                    case 'Y' 'y' ''
                        break
                    case 'N' 'n'
                        cp $TT0 -T ./NOTinstalled.txt
                        echo "See (pwd)/NOTinstalled.txt"
                        break 2
                    case '*'
                        continue
                end
            end
        else
            echo "Install camplete."
            break
        end
    end
    return 0
end
