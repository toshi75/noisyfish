function xsel
    if [ $argv[1] = "-bi" || $argv[1] = "-ib" ]
        xsel -bi && xsel -bo |xsel -pi
    else
        xsel $argv
    end
    return 0
end

