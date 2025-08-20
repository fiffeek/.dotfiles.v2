#!/bin/bash

source $HOME/.bin/wallust-reload.sh

set -e

WALLPAPER="$1"
control-hyprpaper.sh start || true
hyprctl hyprpaper reload ",$WALLPAPER"
wallust run "$WALLPAPER" --skip-sequences
matugen image "$WALLPAPER"
reload
notify-send "Theme changed" "$THEME"
