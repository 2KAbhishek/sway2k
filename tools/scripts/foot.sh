#!/usr/bin/env sh
# wrapper script for foot

USER_CONFIG_PATH="${HOME}/.config/foot/foot.ini"
USER_THEME_CONFIG_PATH="${HOME}/.config/foot/foot-theme.ini"

if [ -f "$USER_THEME_CONFIG_PATH" ]; then
    USER_CONFIG=$USER_THEME_CONFIG_PATH
fi

if [ -f "$USER_CONFIG_PATH" ]; then
    USER_CONFIG=$USER_CONFIG_PATH
fi

foot -c "${USER_CONFIG:-"$HOME/.config/sway/tools/templates/foot.ini"}" $@
