function 4x3
    ffmpeg -hide_banner -i $argv[1] -c copy -aspect 4:3 $argv[2]
    return 0
end
