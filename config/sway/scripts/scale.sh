#!/bin/sh
# Get name and scale of focused output in one call
# Optimized version reducing swaymsg and jq calls from 3 to 1.

output_info=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true) | "\(.name) \(.scale)"')
current_screen="${output_info%% *}"
current_scale="${output_info##* }"
increment=0.1

scale() {
    swaymsg output "\"$current_screen\"" scale "$next_scale"
}

case "$1" in
    "")
        echo "$current_scale"
        ;;
    "up")
        next_scale=$(echo "$current_scale + $increment" | bc)
        scale
        ;;
    "down")
        next_scale=$(echo "$current_scale - $increment" | bc)
        scale
        ;;
esac
