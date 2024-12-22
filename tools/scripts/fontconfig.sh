#!/usr/bin/env sh
set -xu

export CATEGORY=${1:-"monospace"}
export FONT=${2:-"JetBrainsMono NF"}

FONTCONFIG_DIR=$HOME/.config/fontconfig/conf.d

mkdir -p $FONTCONFIG_DIR

cat $HOME/.config/sway/tools/templates/fontconfig.conf | envsubst > $FONTCONFIG_DIR/51-${CATEGORY}.conf
