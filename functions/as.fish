function as
    switch (count $argv)
        case 0
            xsel -bo |
            while read i
                aria2c -S $i
                echo -e "\n#################\n"
            end
        case '*'
            for i in (seq (count $argv))
                aria2c -S $argv[$i]
                echo -e "\n#################\n"
            end
    end
    return 0

end
