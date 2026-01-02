#!/usr/bin/env bash

set -o pipefail
set -eux

WALLPAPER_DIR="$HOME/personal/wallpaper/"
# TODO(fmikina, 02.01.2026): fix to get the current wallpaper
CURRENT_WALL="placeholder"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.png" -o -name "*.jpg" \) ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

wallust-wallpaper-theme.sh "$WALLPAPER"
