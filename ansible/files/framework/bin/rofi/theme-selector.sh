#!/bin/bash

set -e

CONFIG="${1:-default}"
THEME="${2:-default}"

WALLUST_THEME_DIR="$HOME/.config/wallust/colorschemes/"
THEME_FILES=$(find "$WALLUST_THEME_DIR" -maxdepth 1 -name "*.json" -type f -printf "%f\n" 2>/dev/null)
THEMES=$(echo $THEME_FILES | sed 's/.json//g' | tr ' ' '\n')
RANDOM_WALLPAPER="random wallpaper"
THEMES=$(printf "%s\n%s" "$THEMES" "$RANDOM_WALLPAPER")
THEME=$(echo "$THEMES" | rofi -dmenu -p "Select theme:" \
  -config "$HOME/.config/rofi/$CONFIG.rasi" \
  -theme "$HOME/.config/rofi/themes/$THEME.rasi")

if [ -z $THEME ]; then
  exit 0
fi

if [ "$THEME" == "$RANDOM_WALLPAPER" ]; then
  ~/.bin/random-wallpaper.sh
  exit 0
fi

~/.bin/wallust-solid-theme.sh "$THEME"
