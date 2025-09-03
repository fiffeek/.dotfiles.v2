#!/bin/bash

CONFIG="${1:-default}"
THEME="${2:-default}"
MESSAGE="Search github code"

ENGINE="https://github.com/search?q={}&type=code"

selection="$(rofi -dmenu \
  -config "$HOME/.config/rofi/$CONFIG.rasi" \
  -theme "$HOME/.config/rofi/themes/$THEME.rasi" \
  -mesg "$MESSAGE")"

if [ -n "$selection" ]; then
  echo "$selection" | xargs -I{} xdg-open "$ENGINE" && hypr-focus-browser.sh
fi
