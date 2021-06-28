# Defined in /tmp/fish.HC66dZ/mk-is.fish @ line 2
function mk-is
    makepkg --printsrcinfo >.SRCINFO
    makepkg -Ccsi
end
