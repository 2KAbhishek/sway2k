#!/usr/bin/env bash

mkdir -p ~/Pictures/Screenshots/
mkdir -p ~/Videos/Recordings/

ln -sfnv "$PWD"/waybar/ ~/.config/waybar
ln -sfnv "$PWD"/foot/ ~/.config/foot
ln -sfnv "$PWD"/swappy/ ~/.config/swappy
ln -sfnv "$PWD"/sway/ ~/.config/sway
