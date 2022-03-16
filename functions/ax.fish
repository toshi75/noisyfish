function ax
    set DIR "$PWD"
    cd "$DIR"
    switch (count $argv)
        case 0
            set -l TT "(date '+%Y%m%d-%H%M%S').log"
            xsel -bo |
            while read i
                if [ -d "$i" ]
                    cd "$i"
                else
                    echo "$i"
                end
            end >"/tmp/$TT"
            mv "/tmp/$TT" -t "(pwd)"
            cat "(pwd)/$TT" |xargs -P3 -I{} bash -c 'axel {}' &&
            /usr/bin/rm "(pwd)/$TT"
        case 1
            if [ -d $argv[1] ]
                cd $argv[1]
                xsel -bo |xargs -P3 -I{} bash -c 'axel {}'
            elseif [ -f $argv[1] ] &&
                   [ (echo $argv[1] |grep -c torrent\$) -eq 1 ]
                aria2c $argv[1]
            elseif [ -f $argv[1] ] &&
                   [ (file -b --mime-type $argv[1] |sed -e 's|\/.*\$||g') = "text" ]
                cat "$argv[1]" |xargs -P3 -I{} bash -c 'axel {}'
            elseif [ (echo $argv[1] |grep -c ^http) -eq 0 ] &&
                   [ (xsel -bo |grep -c torrent\$)  -eq 1 ]
                aria2c -o {$argv[1]}.torrent (xsel -bo)
            elseif [ (echo $argv[1] |grep -c ^http) -eq 0 ] &&
                   [ (xsel -bo |grep -c torrent\$)  -eq 0 ]
                axel -o {$argv[1]}-axel-working.mp4 (xsel -bo) &&
                ffmpeg -hide_banner -threads auto \
                       -i ./{$argv[1]}-axel-working.mp4 \
                       -c copy -movflags faststart ./"{$argv[1]}.mp4" ||
                ffmpeg -hide_banner -threads auto -y -safe 0 \
                       -i ./{$argv[1]}-axel-working.mp4 \
                       -c copy -movflags faststart ./"{$argv[1]}.mp4"
                if [ (status -f) -eq 0 ]
                    /usr/bin/rm ./{$argv[1]}-axel-working.mp4
                end
            else
                axel $argv[1]
            end
        case '*'
            set -l TT "(date '+%Y%m%d-%H%M%S').log"
            for i in (seq (count $argv))
                if [ -d $argv[$i] ]
                    cd $argv[$i]
                elseif [ -f $argv[1] ] &&
                       [ (file -b --mime-type $argv[1] |
                          sed -e 's|\/.*\$||g') = "text" ]
                    cat $argv[$i]
                else
                    echo $argv[$i]
                end
            end >"/tnp/$TT"
            mv "/tmp/$TT" -t "(pwd)"
            cat "(pwd)/$TT" |xargs -P3 -I{} bash -c 'axel {}' &&
            /usr/bin/rm "(pwd)/$TT"
    end
    cd "$DIR"
    return 0
end
