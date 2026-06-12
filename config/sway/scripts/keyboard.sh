#!/usr/bin/env sh
# script that sets the locale from current locale settings
# Optimized version reducing localectl calls from 4 to 1.

status=$(localectl status)
layout=$(echo "$status" | grep "X11 Layout" | sed -e 's/^.*X11 Layout:\s*//')
variant=$(echo "$status" | grep "X11 Variant" | sed -e 's/^.*X11 Variant:\s*//')

if [ -n "$layout" ]; then
    swaymsg input type:keyboard xkb_layout "$layout"
fi

if [ -n "$variant" ]; then
    swaymsg input type:keyboard xkb_variant "$variant"
fi
