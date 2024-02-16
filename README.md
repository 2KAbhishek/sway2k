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
  <img src="images/screenshot.png" alt="sway2k in action">
  <br/>
  <figcaption>sway2k in action</figcaption>
</figure>

</div>

My personalized configs for [sway window manager](https://swaywm.org/), minimalistic in design and optimized for CLI productivity.

## ✨ Features

- Optimized for the CLI
- Comes with integrations for `foot`, `mako`, `waybar` and more!
- Minimalistic UI
- Optimized for AMOLED displays

## Setup

### ⚡ Requirements

- `sway`: the window manager
- `foot`: waylan terminal emulator
- `rofi`: with [rofi2k](https://github.com/2kabhishek/rofi2k) as launcher
- `waybar`: adds toolbar support
- `mako`: notification daemon
- `grimshot`: screenshot support
- `wf-recorder`: screen recorder support
- `cliphist`: for clipboard management
- `wluma`: adaptive brightness support
- `wlsunset`: sunset timing support
- `light`: for display brightness
- `python`: for scripts support
- `qutebrowser`: with [qute2k](https://github.com/2kabhishek/qute2k) as launcher

```bash
# Arch
sudo pacman -S sway foot rofi waybar mako grimshot wf-recorder cliphist wluma wlsunset light python

# Debian
sudo apt install sway foot rofi waybar mako grimshot wf-recorder cliphist wluma wlsunset light python
```

#### Themes

sway2k uses [BWnB](https://github.com/2KAbhishek/BWnB) as gtk and Kvantum themes, for Firefox it uses [Nightblue](https://github.com/2KAbhishek/nightblue)

Edit [theme.conf](./config.d/theme.conf) to customize accordingly.

### 🚀 Installation

```bash
git clone https://github.com/2kabhishek/sway2k
ln -sfnv "$PWD/sway2k" ~/.config/sway
```

### 💻 Usage

Default apps and defintions can be found in [definitions.conf](config.d/definitions.conf)

- Default launcher: rofi, with [rofi2k](https://github.com/2kabhishek/rofi2k)
- Default browser: qutebrowser, with [qute2k](https://github.com/2kabhishek/qute2k)
- Default camera: guvcview
- Default terminal: foot

You can find keybindings in the [modes dir](config.d/modes/)

Default keybindings are same as [i3 keybindings](https://i3wm.org/docs/userguide.html#_default_keybindings)

<kbd>Mod</kbd> is set to `Super` key.

| Shortcut                                                              | Action                                 |
| --------------------------------------------------------------------- | -------------------------------------- |
| <kbd>Mod</kbd> + <kbd>Enter</kbd>                                     | Open Terminal                          |
| <kbd>Mod</kbd> + <kbd>h/j/k/l</kbd>                                   | Switch focused window                  |
| <kbd>Mod</kbd> + <kbd>left/right/0-9</kbd>                            | Switch focused workspace               |
| <kbd>Mod</kbd> + <kbd>up/down</kbd>                                   | Resize focused workspace               |
| <kbd>Mod</kbd> + <kbd>Tab</kbd>                                       | Most recent workspace                  |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>h/j/k/l/arrows</kbd>         | Move focused window within workspace   |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>0-9</kbd>                    | Move focused window to workspace       |
| <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>h/j/k/l/arrows</kbd>           | Move focused window between screens    |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>m</kbd>                      | Move focused window to empty workspace |
| <kbd>Mod</kbd> + <kbd>n</kbd>                                         | Move to empty workspace                |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>n</kbd>                      | Move focused window away               |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>c</kbd>                      | Reload config                          |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>b</kbd>                      | Toggle waybar                          |
| <kbd>F11</kbd> / <kbd>Mod</kbd> + <kbd>f</kbd>                        | Full screen focused window             |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>f</kbd>                      | Toggle floating                        |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>Enter</kbd> / <kbd>F12</kbd> | Floating terminal                      |
| <kbd>Esc</kbd>                                                        | Close floatin terminal, exit modes     |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>w</kbd>                      | Open default browser                   |
| <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>p</kbd>                      | Open default camera app                |
| <kbd>Mod</kbd> + <kbd>q</kbd>                                         | Close focused window                   |
| <kbd>Alt</kbd> + <kbd>Tab</kbd>                                       | Most recent / urgent window            |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>+/-</kbd>                    | Zoom in / Zoom out                     |
| <kbd>Mod</kbd> + <kbd>Space</kbd>                                     | Open app launcher                      |
| <kbd>Mod</kbd> + <kbd>d</kbd>                                         | Open app launcher in empty workspace   |
| <kbd>Mod</kbd> + <kbd>a</kbd>                                         | Open app switcher                      |
| <kbd>Mod</kbd> + <kbd>v</kbd>                                         | Open clipboard history                 |
| <kbd>Mod</kbd> + <kbd>.</kbd>                                         | Open emoji panel                       |

#### Waybar Modules

Comes with a bunch of customized waybar modules:

- `menu`: app launcher
- `clock`: with calendar integration
- `weather`: powered by wttr.in
- `mode`: sway modes
- `wf-recorder`: screen recorder integration
- `pacman`: package manager integration
- `github`: GitHub notifications with gh cli
- `zeit`: task tracker integration
- `clipboard`: powered by cliphist
- `temperature`: cpu temperatures with sensors
- `cpu`: cpu usage in percentage
- `memory`: shows used ram
- `idle-inhibitor`: controls idle screen turning off
- `battery`: shows battery usages and warnings
- `sunset`: location based gamma correction
- `adaptive-light`: brightness adjustment powered by wluma
- `backlight`: brightness control
- `playerctl`: controls media playback
- `pulseaudio`: cotrols audio devices
- `network`: network connections powered by nmtui
- `bluetooth`: bluetooth adapter controls
- `dnd`: mako dnd integrations
- `tray`: system tray integration

## Behind The Code

### 🌈 Inspiration

A spiritual successor to [awesome2k](https://github.com/2KAbhishek/awesome2k).

I have been using awesome wm for a while and wanted to try out wayland, so I jumped in to sway!

### 💡 Challenges/Learnings

- Learned about wayland and sway APIs

### 🧰 Tooling

- [Dotfiles](https://github.com/2kabhishek/Dotfiles) — Dev Environment
- [nvim2k](https://github.com/2kabhishek/nvim2k) — Personalized Editor

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
