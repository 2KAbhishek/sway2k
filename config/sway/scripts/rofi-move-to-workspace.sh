#!/usr/bin/env bash
set -euo pipefail

rofi_args=(
    -dmenu
    -i
    -markup-rows
    -no-fixed-num-lines
    -p "Move to"
)

workspaces="$(
    swaymsg -t get_workspaces | jq -r '
    sort_by(.num, .name)[] |
    .name as $n |
    (if .focused then "●"
     elif .urgent then "⚡"
     elif .visible then "○"
     else "" end) as $tag |
    "\($tag) \($n)"
  '
)"

menu_input="$(printf ' Scratchpad\n%s\n' "$workspaces")"

choice="$(printf '%s\n' "$menu_input" | rofi "${rofi_args[@]}")"
[[ -n "$choice" ]] || exit 0

if [[ "$choice" == *"Scratchpad"* ]]; then
    swaymsg "move scratchpad" >/dev/null
    exit 0
fi

target="${choice#* }"

swaymsg "move container to workspace \"$target\"" >/dev/null
swaymsg "workspace \"$target\"" >/dev/null
