#!/bin/bash

STYLE="$HOME/.config/wofi/style.css"

# We use the Nerd Font icons directly in the string
# The 'awk' part is updated to make sure we grab the right word after the icon
op=$(echo -e "󰌾 Lock\n Shutdown\n  Reboot\n  Suspend\n󰈆  Logout" | \
    wofi --show dmenu \
         --style "$STYLE" \
         --width 200 \
         --height 210 \
         --always_parse_args \
         --cache-file /dev/null | awk '{print $2}')

case $op in
    Lock) hyprlock ;;
    Shutdown) systemctl poweroff ;;
    Reboot)   systemctl reboot ;;
    Suspend)  systemctl suspend ;;
    Logout)   hyprctl dispatch exit ;;
esac
