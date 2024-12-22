#!/usr/bin/env sh
set -xu

export CROWN=$1
export ROOT=$2
export BACKGROUND=$3

# shellcheck disable=SC2002
cat "$HOME/.config/sway/tools/templates/manjarosway-scalable.svg" | envsubst >"$HOME/.config/sway/user/generated_background.svg"
