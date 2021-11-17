function sendbk
    cd (pwd)
    set TT (mktemp)
    set DIR ""
    for i in (seq (count $argv))
        if [ ! -h $argv[$i] ]
            if [ -d $argv[$i] ]
                set DIR (realpath $argv[$i])
            else
                echo $argv[$i]
            end
        end
    end >"$TT"
    if [ $DIR = "" ]
        echo ""
        echo "sendbk: No \"Move to\" dir."
        rm $TT
        return 99
    end
    set ALL (cat $TT |wc -l)
    set N 1
    cat $TT |
    while read i
        echo ""
        echo "### $N / $ALL ###"
        rsync -Pahvz --remove-source-files $i $DIR
        ln -s $DIR/(basename $i) (dirname $i)
        set N (math $N + 1)
    end
    rm $TT
end
