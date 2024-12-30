#!/usr/bin/env bash

# A Bash sciript for working and resting productivity with pomodoro method

while true; do
    # Question dialog
    if zenity --question --text="Chceš zažít svůj třicetiminutový pracovní interval?"; then
        # User said yes
        # Enable do not disturb mode
        gsettings set org.gnome.desktop.notifications show-banners false
        sleep 30m
        
        # Play a notification sound
        ffplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga -autoexit -nodisp
        # Show info dialog for resting after 30 minutes
        zenity --info --text="30 minut uplynulo. Nyní je čas na 5 minut odpočinku. Stiskni OK pro pokračování."
        
        # Disable do not disturb mode
        gsettings set org.gnome.desktop.notifications show-banners true
        # Sleep again
        sleep 5m
        # Play a notification sound
        ffplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga -autoexit -nodisp
    else
    	# Disable do not disturb mode
        gsettings set org.gnome.desktop.notifications show-banners true
        # User said no, end the script
        exit
    fi
done
	
