function rmvm
    echo "Your VM(s)..."
    echo
    echo '== Start ============================='
    VBoxManage list vms
    echo '== E N D ============================='
    echo
    echo 'Name or UUID plz.'
    read -p '>++X(^>|' ANS
    VBoxManage unregistervm $ANS --delete
    return 0
end


