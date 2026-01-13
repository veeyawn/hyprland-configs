#!/bin/bash

# Folder containing your wallpapers
DIR=/mnt/media/nextcloud/personal/wallpaper

# Select a random image
IMAGE=$(find "$DIR" -type f | shuf -n 1)

# Preload the new image
hyprctl hyprpaper preload "$IMAGE"

# Set it on all monitors (or specify individual ones)
hyprctl hyprpaper wallpaper "DP-4,$IMAGE"
hyprctl hyprpaper wallpaper "HDMI-A-4,$IMAGE"

# Unload old wallpapers to save RAM
hyprctl hyprpaper unload all
