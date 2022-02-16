function mk
    set -l DIR (pwd)
    set -l TT  (mktemp)
    cd $DIR
    for i in (seq (count $argv))
        if     [ -d $argv[$i] ]
            cd $argv[$i]
        elseif [ -f $argv[$i] ]
            cd (dirname $argv[$i])
        else
            echo -n "$argv[$i] "
        end
    end      >$TT
    echo "" >>$TT
    makepkg --printsrcinfo >.SRCINFO
    makepkg -Cc --needed (cat $TT)
    rm $TT
    cd $DIR
end
