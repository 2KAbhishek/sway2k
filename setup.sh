#!/usr/bin/env bash

set -e

# Detect if the system is Arch-based
if [ -f /etc/arch-release ] || command -v pacman &>/dev/null; then
    echo "Arch Linux detected. Preparing to install dependencies..."

    sudo pacman -S --needed \
        autotiling base-devel bc bluetui btop calcurse cliphist dex foot grim guvcview imv \
        jq kanshi kvantum libnotify lxappearance mpv networkmanager noto-fonts-emoji pcmanfm \
        pulsemixer python qutebrowser rofi rofi-emoji slurp swappy sway swaybg sway-contrib \
        swayidle swaylock swaync swayosd ttf-firacode-nerd ttf-roboto waybar wdisplays \
        wf-recorder wlsunset xdg-user-dirs xorg-xwayland
else
    echo "Warning: This script only supports package installation on Arch-based systems."
fi

echo "Creating system directories..."
mkdir -p ~/Pictures/Screenshots/
mkdir -p ~/Videos/Recordings/

echo "Creating symlinks to ~/.config..."
ln -sfnv "$PWD"/config/foot ~/.config/foot
ln -sfnv "$PWD"/config/kanshi ~/.config/kanshi
ln -sfnv "$PWD"/config/swappy ~/.config/swappy
ln -sfnv "$PWD"/config/sway ~/.config/sway
ln -sfnv "$PWD"/config/swaync ~/.config/swaync
ln -sfnv "$PWD"/config/swayosd ~/.config/swayosd
ln -sfnv "$PWD"/config/waybar ~/.config/waybar

echo "Setup completed successfully!"
echo "yay -S themix-full-git # Install themix themes, one time requirement for BWnB theme."
