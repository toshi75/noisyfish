function reflect
    echo "sudo \\"
    echo "reflector \\"
    echo "    --latest 20 \\"
    echo "    -p http -p https \\"
    echo "    --sort rate \\"
    echo "    --save /etc/pacman.d/mirrorlist"
    sudo reflector --latest 20      \
                   -p http -p https \
                   --sort rate      \
                   --save '/etc/pacman.d/mirrorlist'
    cat '/etc/pacman.d/mirrorlist'
end
