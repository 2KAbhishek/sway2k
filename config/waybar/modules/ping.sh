#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

pingserver=${WAYBAR_PING_SERVER:-"google.com"}

ping_function() {
    case $(uname -s) in
    Linux | Darwin)
        pingtime=$(ping -c 1 "$pingserver" | tail -1 | awk '{split($4, times, "/"); printf "%.2f", times[2]}')
        echo "$pingtime ms"
        ;;

    CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;
    esac
}

main() {
    echo "󱘖 $(ping_function)"
}

main
