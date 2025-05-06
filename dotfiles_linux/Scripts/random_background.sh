#!/bin/bash

PATH_BACKGROUNDS="$HOME/Pictures/wallpapers"
PATH_CURRENT_WALLPAPER="$HOME/.current_wallpaper"

current_wallpaper=''
if [ -e "$PATH_CURRENT_WALLPAPER" ]; then
    current_wallpaper=$(cat $PATH_CURRENT_WALLPAPER)
fi

mapfile -t wallpapers < <(find $PATH_BACKGROUNDS -type f)

num_wallpapers=${#wallpapers[@]}

echo "Found $num_wallpapers wallpapers."
if [[ $num_wallpapers -eq 0 ]]; then
    echo "No wallpapers, exiting."
    exit 1
fi


while true; do
    random_number=$((RANDOM % $num_wallpapers))
    wallpaper=${wallpapers[$random_number]}

    if [[ $wallpaper != $current_wallpaper ]]; then
        break
    else
        echo "Rerolling!"
    fi
done

echo "Setting $wallpaper as background..."
hsetroot -cover $wallpaper

echo "$wallpaper" > $PATH_CURRENT_WALLPAPER 
