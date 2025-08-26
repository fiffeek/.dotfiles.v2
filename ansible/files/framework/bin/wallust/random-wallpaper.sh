#!/usr/bin/env bash

set -o pipefail
set -eux

WALLPAPER_DIR="$HOME/personal/wallpaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded || echo "placeholder")
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.png" -o -name "*.jpg" \) ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

wallust-wallpaper-theme.sh "$WALLPAPER"
