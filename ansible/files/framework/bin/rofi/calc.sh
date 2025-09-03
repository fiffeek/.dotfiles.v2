#!/bin/bash

CONFIG="${1:-default}"
THEME="${2:-calc}"

if pgrep -x "rofi" >/dev/null; then
  pkill rofi
fi

while true; do
  result=$(
    rofi -i -dmenu \
      -config "$HOME/.config/rofi/$CONFIG.rasi" \
      -theme "$HOME/.config/rofi/themes/$THEME.rasi" \
      -mesg "$result      =    $calc_result"
  )

  # shellcheck disable=SC2181
  if [ $? -ne 0 ]; then
    exit
  fi

  if [ -n "$result" ]; then
    calc_result=$(qalc -t "$result")
    echo "$calc_result" | wl-copy
  fi
done
