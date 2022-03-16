function upxx
    for i in (seq (count $argv))
        if [ (ls -l $argv[$i] |awk '{print $5}') -gt 100000000 ]
            doas upx $argv[$i]
        else
            doas upx --best $argv[$i]
        end
    end
end
