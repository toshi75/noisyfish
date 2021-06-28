# Defined in /tmp/fish.P7HERc/op.fish @ line 1
function op
    if [ (count $argv) -eq 0 ]
        xdg-open ./
    else
        xdg-open $argv
    end
end
