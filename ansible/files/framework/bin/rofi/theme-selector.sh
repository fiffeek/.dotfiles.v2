#!/bin/bash

set -e

CONFIG="${1:-default}"
THEME="${2:-default}"

WALLUST_THEME_DIR="$HOME/.config/wallust/colorschemes/"
THEME_FILES=$(find "$WALLUST_THEME_DIR" -maxdepth 1 -name "*.json" -type f -printf "%f\n" 2>/dev/null)
THEMES=$(echo $THEME_FILES | sed 's/.json//g' | tr ' ' '\n')
THEME=$(echo "$THEMES" | rofi -dmenu -p "Select theme:" \
  -config "$HOME/.config/rofi/$CONFIG.rasi" \
  -theme "$HOME/.config/rofi/themes/$THEME.rasi")

~/.bin/wallust-solid-theme.sh "$THEME"
