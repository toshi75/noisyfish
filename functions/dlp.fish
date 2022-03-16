function dlp
    yt-dlp --no-warnings --no-check-certificates \
        --embed-metadata --embed-thumbnail \
        --downloader='axel' $argv[1] --exec '/usr/local/bin/moov {}'
end
