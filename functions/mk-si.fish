# Defined in /tmp/fish.T02pcI/mk-si.fish @ line 2
function mk-si
    makepkg --printsrcinfo >.SRCINFO
    makepkg -Ccsi
end
