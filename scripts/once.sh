#!/usr/bin/env sh
# execute a command only once - if its already running, don't run again, useful for autostart, waybar execs
HASH="$(echo "$@" | shasum | cut -f1 -d" " | cut -c1-7)"

mkdir -p "$HOME/.local/state"

flock --verbose -n "$HOME/.local/state/${HASH}.lock" "$@"
