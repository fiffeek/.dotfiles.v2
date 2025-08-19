#!/bin/bash

set -x

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)
HZ=$(hyprctl monitors -j | jq -r '.[] | select(.name=="eDP-1") | "\(.refreshRate)"')

function notify {
  notify-send \
    --hint=string:synchronous:refresh-rate \
    --hint=string:x-dunst-stack-tag:refresh-rate \
    "Monitor adjusted" "Refresh rate $1" || true
}

if [ "$POWER_STATUS" -eq 1 ]; then
  if [[ "$HZ" =~ 120.* ]]; then
    exit 0
  fi
  hyprctl keyword monitor "eDP-1,2880x1920@120.00000,0x0,2.0,vrr,1"
  notify "120"
else
  if [[ "$HZ" =~ 60.* ]]; then
    exit 0
  fi
  hyprctl keyword monitor "eDP-1,2880x1920@60.00000,0x0,2.0,vrr,1"
  notify "60"
fi
