#!/bin/bash
hyprpaper &
sleep 1
# Set the directory containing your wallpapers
directory=~/wallpaper

# Get the monitor identifier from hyprctl
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

# Check if the directory exists
if [ -d "$directory" ]; then
    # Select a random background image
    random_background=$(ls $directory/*.{png,jpg} 2>/dev/null | shuf -n 1)
       

    # Unload all existing wallpapers
    hyprctl hyprpaper unload all

    # Preload the selected random wallpaper
    hyprctl hyprpaper preload $random_background

    # Set the selected random wallpaper for the monitor
    hyprctl hyprpaper wallpaper "$monitor, $random_background"
fi
