function yadsu
    if test sudo -nv 2>/dev/null
        sudo "$@"
        exit $?
    end

    if [ -e /usr/bin/kdialog ]
	    set PASSWD (
	        kdialog --title "Authentication" \
	                --password "Authentication required for $USER"
	    )
    elseif [[ -e /usr/bin/yad ]
	    set PASSWD (
	        yad --entry --entry-label "Password" \
	            --hide-text --image=password \
	            --window-icon=dialog-password \
	            --text="Authentication required for $USER" \
	            --title=Authentication --center
	    )
    elseif [ -e /usr/bin/zenity ]
	    set PASSWD (
	        zenity --password --title Authentication
	    )
    else
	    echo "Dependency not available." 
	    echo "Please install at least one of: spacefm, kdialog, yad, zenity"
    end

    if     [ "$dialog_pressed_label" = 'cancel' ]
	    echo "triggered cancel"
	    exit 100
    elseif [ -z "$PASSWD" ]
	    echo "triggered empty"
	    exit 110
    else
	    echo triggered PW
	    echo $PASSWD | sudo -S "$@"
    end

    if [ $status -eq 1 ]
	    if   [ -e /usr/bin/kdialog ]
		    set PASSWD (
		        kdialog --title "Wrong password, retry" \
		                --password "Authentication required for $USER"
		    )
	    elseif [ -e /usr/bin/yad ]
		    set PASSWD (
		        yad --entry --entry-label "Password" \
		            --hide-text --image=dialog-error \
		            --window-icon=dialog-password \
		            --text="Wrong password, retry" \
		            --title=Authentication --center
		    )
	    else
		    set PASSWD (
		        zenity --password --title="Wrong password, retry"
		    )
	    end
	    echo "$PASSWD" | sudo -S "$@"
    end
    return 0
end

