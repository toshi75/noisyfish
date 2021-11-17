function reflect
    sudo reflector --latest 20 \
              -p http -p https \
              --sort rate \
              --save '/etc/pacman.d/mirrorlist'
    cat '/etc/pacman.d/mirrorlist'
end
