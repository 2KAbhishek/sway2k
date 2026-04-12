<div align = "center">

<h1><a href="https://github.com/2kabhishek/sway2k">sway2k</a></h1>

<a href="https://github.com/2KAbhishek/sway2k/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/sway2k?style=flat&color=eee&label="> </a>

<a href="https://github.com/2KAbhishek/sway2k/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/2kabhishek/sway2k?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/2KAbhishek/sway2k/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/sway2k?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/2KAbhishek/sway2k/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/sway2k?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/sway2k/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/2kabhishek/sway2k?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/2KAbhishek/sway2k/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/2kabhishek/sway2k?style=flat&color=e06c75&label="> </a>

<h3>Swaying Windows in Wayland 🎏🛣</h3>

<figure>
  <img src="docs/images/screenshot.jpg" alt="sway2k in action">
  <br/>
  <figcaption>sway2k in action</figcaption>
</figure>

</div>

My personalized configs for [sway window manager](https://swaywm.org/), minimalistic in design and optimized for developer productivity and speed.

## ✨ Features

- Optimized for keyboard driven CLI workflow
- Minimalistic UI, optimized for AMOLED displays

## Setup

### ⚡ Requirements

#### Packages

All the mentioned packages may not be available in your package manager, you might have to install them manually.

```bash
# Arch
sudo pacman -S sway foot rofi waybar mako calcurse grim slurp \
jq pulsemixer wf-recorder cliphist wlsunset swappy python btop xorg-xwayland \
qutebrowser xdg-user-dirs kvantum lxappearance rofi-emoji bluetui wdisplays \
swayidle swaylock sway-contrib guvcview pcmanfm mpv imv base-devel \
networkmanager libnotify ttf-firacode-nerd noto-fonts-emoji ttf-roboto

yay themix-full-git topgrade-bin --noconfirm
```

#### Recommended Configurations

Highly recommended to use this alongside the following configurations:

- [rofi2k](https://github.com/2kabhishek/rofi2k) as rofi config
- [qute2k](https://github.com/2kabhishek/qute2k) as quetbrowser config
- [dots2k](https://github.com/2kabhishek/dots2k) CLI Dev Environment
- [nvim2k](https://github.com/2kabhishek/nvim2k) Personalized Editor

### 🚀 Installation

```bash
git clone https://github.com/2kabhishek/sway2k
cd sway2k
./install.sh
```

## 💻 Usage

### Keybindings

All the configured keybindings can be found in the [keybinding manual here](./docs/keybindings.md).

### Theming

Edit [theme.conf](./config.d/theme.conf) to customize themes. This will override options selected via lxappearance.

#### Themix

After installing themix, find BWnB in the Contributed section, click on "Export Theme" and set the export path to `~/.local/share/themes/BWnB`

> themix can be removed after BWnB gtk theme export

#### Kvantum

Clone [BWnb](https://github.com/2kabhishek/BWnb) to a directory. Launch Kvantum Manager and select the `BWnB/kvantum/BWnB` folder and click install.

> If the theme is not installed manually, Kvantum will always open after restart.

#### Icons

Download [Reversal-blue Icons](https://www.pling.com/p/1340791) and extract it to `~/.local/share/icons` or install the downloaded `Reversal-blue.tar.xz` file via lxappearance.

### Waybar Modules

Comes with a bunch of customized [waybar modules](./waybar/config.jsonc)

- `menu`: app launcher
- `clock`: with calendar integration
- `mode`: sway modes
- `wf-recorder`: screen recorder integration
- `pacman`: package manager integration
- `github`: GitHub notifications with gh cli
- `clipboard`: powered by cliphist
- `temperature`: cpu temperatures with sensors
- `cpu`: cpu usage in percentage
- `memory`: shows used ram
- `idle-inhibitor`: controls idle screen turning off
- `battery`: shows battery usages and warnings
- `sunset`: location based gamma correction
- `backlight`: brightness control
- `playerctl`: controls media playback
- `pulseaudio`: controls audio devices
- `network`: network connections powered by nmtui
- `bluetooth`: bluetooth adapter controls
- `dnd`: mako dnd integrations
- `tray`: system tray integration

These modules share their behaviour with [tmux2k plugins](https://github.com/2kabhishek/tmux2k#-available-plugins)

- `weather`: powered by wttr.in
- `ping`: shows ping status of a server
- `gpu`: shows GPU usage
- `uptime`: shows system uptime

If you want to use the waybar config by itself, you can do so by running:

```bash
# To setup waybar separately
ln -sfnv "$PWD/sway2k/waybar" ~/.config/waybar
```

## Behind The Code

### 🌈 Inspiration

A spiritual successor to [awesome2k](https://github.com/2KAbhishek/awesome2k).

I have been using awesome wm for a while and wanted to try out wayland, so I jumped in to sway!

### 💡 Challenges/Learnings

- Learned about wayland and sway APIs

### 🔍 More Info

- [awesome2k](https://github.com/2kabhishek/awesome2k) — Xorg based tiling wm configs

<hr>

<div align="center">

<strong>⭐ hit the star button if you found this useful ⭐</strong><br>

<a href="https://github.com/2KAbhishek/sway2k">Source</a>
| <a href="https://2kabhishek.github.io/blog" target="_blank">Blog </a>
| <a href="https://twitter.com/2kabhishek" target="_blank">Twitter </a>
| <a href="https://linkedin.com/in/2kabhishek" target="_blank">LinkedIn </a>
| <a href="https://2kabhishek.github.io/links" target="_blank">More Links </a>
| <a href="https://2kabhishek.github.io/projects" target="_blank">Other Projects </a>

</div>
