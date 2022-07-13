function 16x9
    for i in (seq (count $argv))
        set -l EXT  (echo $argv[$i] |sed -e 's|^.*\.||g')
        set -l ORIG (echo $argv[$i])-ORIGASPECT.{$EXT}
        mv $argv[$i] $ORIG
        ffmpeg -hide_banner -threads auto \
               -i $ORIG -c copy -aspect 16:9 \
               -movflags faststart $argv[$i] ||
        ffmpeg -hide_banner -threads auto -safe 0 -y \
               -i $ORIG -c copy -aspect 16:9 \
               -movflags faststart $argv[$i]
    end
    return 0
end
