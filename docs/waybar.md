# Waybar Modules

Comes with a bunch of customized [waybar modules](../waybar/config.jsonc):

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
- `notification`: swaync notification center and dnd integrations
- `tray`: system tray integration

These modules share their behaviour with [tmux2k plugins](https://github.com/2kabhishek/tmux2k#-available-plugins):

- `weather`: powered by wttr.in
- `ping`: shows ping status of a server
- `gpu`: shows GPU usage
- `uptime`: shows system uptime

---

## Standalone Setup

If you want to use the Waybar config by itself, you can do so by running:

```bash
# To setup waybar separately
ln -sfnv "$PWD/waybar" ~/.config/waybar
```
