function get-browsers
    paru -S --needed --noconfirm \
        w3m lynx links elinks \
        google-chrome \
        microsoft-edge-stable-bin \
        yandex-browser \
        cloudflare-warp-bin
    return 0
end
