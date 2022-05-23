function 16x9
    ffmpeg -hide_banner -i $argv[1] -c copy -aspect 16:9 $argv[2]
    return 0
end
