function pq
    if [ $argv[1] = "-h" ] || [ $argv[1] = "--help" ]
        type "pq"
        return 100
    end
    paru -Qi $argv[1]
    echo "Open URL?"
    read -n1 -p'echo "Y/n >"' REPLY
    echo ""
    switch $REPLY
        case Y y ' '
            nohup xdg-open (
                paru -Qi $argv[1] |
                tr -d " " |
                grep "URL:" |
                sed -e 's|^URL:||g'
            ) &>/dev/null &
        case '*'
            :
    end
    return 0
end
