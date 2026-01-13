#!/bin/bash

# Configuration
STYLE="$HOME/.config/wofi/style.css"
CONFIG="$HOME/.config/wofi/config"

# Define entries with icons (Using standard Adwaita/Papirus icon names)
# Format: img:<path/to/icon>:text:<display_name>
entries="img:/usr/share/icons/Adwaita/symbolic/status/system-lock-screen-symbolic.svg:text:Lock\nimg:/usr/share/icons/Adwaita/symbolic/actions/system-log-out-symbolic.svg:text:Logout\nimg:/usr/share/icons/Adwaita/symbolic/actions/system-reboot-symbolic.svg:text:Reboot\nimg:/usr/share/icons/Adwaita/symbolic/status/system-shutdown-symbolic.svg:text:Shutdown"

selected=$(echo -e "$entries" | wofi --show dmenu --style "$STYLE" --conf "$CONFIG" --allow-images --width 300 --height 320 --cache-file /dev/null)

# Extract just the text part (after :text:)
choice=$(echo "$selected" | awk -F':text:' '{print $2}')

case $choice in
    Lock)     hyprlock ;;
    Logout)   hyprctl dispatch exit ;;
    Reboot)   systemctl reboot ;;
    Shutdown) systemctl poweroff ;;
esac
