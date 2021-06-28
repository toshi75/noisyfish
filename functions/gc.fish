# Defined in /tmp/fish.OZ3YSQ/gc.fish @ line 1
function gc
    if [ (count $argv) -eq 0 ]
        git clone (xsel -bo)
    else
        git clone $argv
    end
end
