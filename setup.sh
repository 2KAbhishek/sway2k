#!/usr/bin/env bash
set -e

current_dir="${BASH_SOURCE[0]%/*}"
[[ "$current_dir" == "${BASH_SOURCE[0]}" || "$current_dir" == "." ]] && current_dir="$PWD"
readonly current_dir

case "${OSTYPE:-$(uname -s)}" in
    darwin* | Darwin* | *darwin*) HOST_OS="darwin" ;;
    linux* | Linux* | *linux*)   HOST_OS="linux" ;;
    freebsd* | FreeBSD* | *freebsd*) HOST_OS="freebsd" ;;
    *) HOST_OS="linux" ;;
esac
readonly HOST_OS

cmd_sudo() {
    if [[ "$EUID" -ne 0 ]] && command -v sudo &>/dev/null; then
        sudo "$@"
    else
        "$@"
    fi
}

# Detect if the system is Arch-based
if [ -f /etc/arch-release ] || command -v pacman &>/dev/null; then
    echo "Arch Linux detected. Preparing to install dependencies..."

    cmd_sudo pacman -S --needed --noconfirm \
        autotiling base-devel bc bluetui btop calcurse cliphist dex foot grim guvcview imv \
        jq kanshi kvantum libnotify lxappearance lxqt-policykit mpv networkmanager noto-fonts-emoji udiskie \
        pulsemixer python qutebrowser rofi rofi-emoji slurp swappy sway swaybg sway-contrib \
        swayidle swaylock swaync swayosd ttf-firacode-nerd ttf-roboto waybar wdisplays \
        wf-recorder wlsunset xdg-user-dirs xorg-xwayland
else
    echo "Warning: This script only supports automated package installation on Arch-based systems."
fi

echo "Creating system directories..."
mkdir -p "$HOME/Pictures/Screenshots"
mkdir -p "$HOME/Videos/Recordings"

echo "Creating symlinks to ~/.config..."
mkdir -p "$HOME/.config"
ln -sfnv "$current_dir/config/foot" "$HOME/.config/foot"
ln -sfnv "$current_dir/config/kanshi" "$HOME/.config/kanshi"
ln -sfnv "$current_dir/config/swappy" "$HOME/.config/swappy"
ln -sfnv "$current_dir/config/sway" "$HOME/.config/sway"
ln -sfnv "$current_dir/config/swaync" "$HOME/.config/swaync"
ln -sfnv "$current_dir/config/swayosd" "$HOME/.config/swayosd"
ln -sfnv "$current_dir/config/waybar" "$HOME/.config/waybar"

echo "sway2k setup completed successfully!"
