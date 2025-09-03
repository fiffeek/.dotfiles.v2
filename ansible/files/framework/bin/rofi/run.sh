#!/bin/bash

CONFIG="${1:-default}"
THEME="${2:-default}"

rofi -show combi -combi-modes run,window,filebrowser -modi combi \
  -config "$HOME/.config/rofi/$CONFIG.rasi" \
  -theme "$HOME/.config/rofi/themes/$THEME.rasi"
