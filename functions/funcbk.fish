function funcbk
    if [ -f $HOME/.config/fish/functions/{$argv[1]}.fish ]]
        cp  $HOME/.config/fish/functions/{$argv[1]}.fish \
         -T $HOME/.config/fish/functions/{$argv[1]}.fish.(date '+%Y%m%d-%H%M%S')
    else
        echo "function \"{$argv[1]}\" not found."
        if [ type $argv[1] &>/dev/null ]
            echo "Something \"{$argv[1]}\" found."
            echo "type: (type $argv[1])"
        else
            echo -n "type: "
            type $argv[1]
        end
        if [ which $argv[1] &>/dev/null ]
            echo "Something \"{$argv[1]}\" found."
            echo "which: (which $argv[1])"
        else
            echo -n "which: "
            which $argv[1]
        end
    end
    return 0
end
