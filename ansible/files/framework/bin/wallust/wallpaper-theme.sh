#!/bin/bash

source $HOME/.bin/wallust-reload.sh

set -e

WALLPAPER="$1"
(systemctl --user start hyprpaper && sleep 2) || true
hyprctl hyprpaper reload ",$WALLPAPER"
wallust run "$WALLPAPER" --skip-sequences
matugen image "$WALLPAPER"
reload
notify-send "Theme changed" "$THEME"
