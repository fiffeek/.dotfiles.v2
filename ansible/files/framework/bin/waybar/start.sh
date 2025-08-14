#!/bin/zsh

killall waybar >/dev/null

waybar --config ~/.config/waybar/config.jsonc --style ~/.config/waybar/style.css
