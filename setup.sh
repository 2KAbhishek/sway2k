#!/usr/bin/env bash

set -e

# Detect if the system is Arch-based
if [ -f /etc/arch-release ] || command -v pacman &>/dev/null; then
    echo "Arch Linux detected. Preparing to install dependencies..."

    sudo pacman -S --needed \
        base-devel bluetui btop calcurse cliphist foot grim guvcview imv jq kanshi kvantum \
        libnotify lxappearance mpv networkmanager noto-fonts-emoji pcmanfm pulsemixer python \
        qutebrowser rofi rofi-emoji slurp swappy sway swaybg sway-contrib swayidle swaylock \
        swaync swayosd ttf-firacode-nerd ttf-roboto waybar wdisplays wf-recorder wlsunset \
        xdg-user-dirs xorg-xwayland

    # Run yay if available for AUR packages
    if command -v yay &>/dev/null; then
        echo "Installing AUR packages..."
        yay -S --needed themix-full-git topgrade-bin --noconfirm
    else
        echo "Warning: 'yay' (AUR helper) is not installed. Please install manually from the AUR."
    fi
else
    echo "Warning: This script only supports package installation on Arch-based systems."
fi

echo "Creating system directories..."
mkdir -p ~/Pictures/Screenshots/
mkdir -p ~/Videos/Recordings/

echo "Creating symlinks to ~/.config..."
ln -sfnv "$PWD"/waybar/ ~/.config/waybar
ln -sfnv "$PWD"/kanshi/ ~/.config/kanshi
ln -sfnv "$PWD"/foot/ ~/.config/foot
ln -sfnv "$PWD"/swappy/ ~/.config/swappy
ln -sfnv "$PWD"/swaync/ ~/.config/swaync
ln -sfnv "$PWD"/swayosd/ ~/.config/swayosd
ln -sfnv "$PWD"/../sway2k/ ~/.config/sway

echo "Setup completed successfully!"
