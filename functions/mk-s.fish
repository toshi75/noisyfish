# Defined in /tmp/fish.X6g6ne/mk-s.fish @ line 2
function mk-s
    makepkg --printsrcinfo >.SRCINFO
    makepkg -Ccs
end
