function gt
    cd (pwd)
    xsel -bo |
    aria2c --follow-torrent=false -a -
    echo ""
end
