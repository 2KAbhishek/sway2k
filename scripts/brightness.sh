#!/bin/sh

current_abs=$(brightnessctl get)
current_rel() {
    brightnessctl get | tr -d '%'
}
max=$(brightnessctl max)
factor=3
brightness_step=$((max * factor / 100 < 1 ? 1 : max * factor / 100))

case $1'' in
'') ;;
'down')
    if [ "$(current_rel)" -le "$factor" ] && [ "$current_abs" -gt 0 ] && [ "$current_abs" -ne 1 ]; then
        brightnessctl set 1
    else
        brightnessctl set "$brightness_step"-
    fi
    ;;
'up')
    brightnessctl set "$brightness_step"+
    ;;
esac

current_rel
