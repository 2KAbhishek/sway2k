#!/bin/bash
# Find the first empty workspace number from 1 to 10 and switch/move to it.
# Optimized Shell/jq version replacing the original Python script.

switch=false
move=false

for arg in "$@"; do
    case "$arg" in
        -s|--switch)
            switch=true
            ;;
        -m|--move)
            move=true
            ;;
    esac
done

if [ "$switch" = false ] && [ "$move" = false ]; then
    echo "Usage: $0 [--switch] [--move]"
    exit 1
fi

# Query workspace list and find the lowest unused workspace number from 1 to 10
target=$(swaymsg -t get_workspaces | jq -r '
  (.[] | select(.focused)) as $curr
  | map(select(.representation != null) | .num) as $busy
  | [range(1; 11)]
  | map(select(. as $n | $busy | contains([$n]) | not)) as $empty
  | if ($empty | length > 0) then $empty[0] else $curr.num end
')

if [ "$move" = true ] && [ "$switch" = true ]; then
    swaymsg "move container to workspace number $target; workspace number $target"
elif [ "$switch" = true ]; then
    swaymsg "workspace number $target"
elif [ "$move" = true ]; then
    swaymsg "move container to workspace number $target"
fi
