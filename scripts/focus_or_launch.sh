#!/bin/bash
# Usage: focus_or_launch.sh <command> [app_id]
# Example: focus_or_launch.sh foot
#          focus_or_launch.sh qutebrowser org.qutebrowser.qutebrowser

CMD="$1"
APP_ID="${2:-$1}"

if [ -z "$CMD" ]; then
    echo "Usage: $0 <command> [app_id]"
    exit 1
fi

# Find an existing window with the given app_id
WIN_ID=$(swaymsg -t get_tree | jq -r '.. | select(.app_id? == "'"$APP_ID"'") | .id' | head -n1)

if [ -n "$WIN_ID" ]; then
    swaymsg [con_id="$WIN_ID"] focus
else
    "$CMD" &
fi
