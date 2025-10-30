#!/bin/bash

set -ex

CONFIG="${1:-default}"
THEME="${2:-default}"
MESSAGE="Ask anything"

PRIMARY_ENGINE_BASE="https://search.home.filipmikina.com"
PRIMARY_ENGINE="$PRIMARY_ENGINE_BASE/search?q={}&language=en-US&time_range=&safesearch=0&categories=general"
FALLBACK_ENGINE="https://duckduckgo.com/?q={}"

if curl --head --retry 0 --connect-timeout 1 --max-time 1 --silent --fail "$PRIMARY_ENGINE_BASE" >/dev/null; then
  ENGINE="$PRIMARY_ENGINE"
else
  ENGINE="$FALLBACK_ENGINE"
fi

selection="$(rofi -dmenu \
  -config "$HOME/.config/rofi/$CONFIG.rasi" \
  -theme "$HOME/.config/rofi/themes/$THEME.rasi" \
  -mesg "$MESSAGE")"

if [ -n "$selection" ]; then
  echo "$selection" | xargs -I{} xdg-open "$ENGINE" && hypr-focus-browser.sh
fi
