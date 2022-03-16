function rmvh
    cd "(pwd)"
    set N 1
    while [ $N -le (count $argv) ]
        echo "$N / (count $argv)"
        rsync -Pahvz --remove-source-files "$argv[$N]" "(pwd)"
        set N (math $N + 1)
    end
end
