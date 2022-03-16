function rsmv
    if [ ! -d $argv[1] ]
        echo "Dist folder first."
        return 99
    end
    set -l ALL (count $argv)
    set -l NO 1
    set -l DIST $argv[1]
    for i in (seq 2 $ALL)
        echo "#=#=#=# $NO / $ALL #=#=#=#"
        rsync -Pahvz --remove-source-files $argv[$i] $DIST
        echo ""
    end
    return 0
end
