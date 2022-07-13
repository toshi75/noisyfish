function mk-is
    set -l DIR (pwd)
    cd $DIR
    switch (count $argv)
        case 0
            makepkg --printsrcinfo >.SRCINFO
            makepkg -Ccis
        case '*'
            for i in (seq (count $argv))
                if     [ -d $argv[$i] ]
                    cd $argv[$i]
                elseif [ -f $argv[$i] ]
                    cd (dirname $argv[$i])
                end
                makepkg --printsrcinfo >.SRCINFO
                makepkg -Ccis
            end
    end
    cd $DIR
    return 0
end
