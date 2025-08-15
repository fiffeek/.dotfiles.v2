#!/bin/bash

CONFIG="${1:-default}"
THEME="${2:-default}"

rofi -show combi -combi-modes search,run,window,filebrowser -modi combi \
  -config "$HOME/.config/rofi/$CONFIG.rasi" \
  -theme "$HOME/.config/rofi/themes/$THEME.rasi" \
  -modi "search:$HOME/.config/rofi/bin/rofi-web-search.py"
