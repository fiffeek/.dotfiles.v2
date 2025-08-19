#!/bin/bash

set -x

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)
HZ=$(hyprctl monitors -j | jq -r '.[] | select(.name=="eDP-1") | "\(.refreshRate)"')

if [ "$POWER_STATUS" -eq 1 ]; then
  if [[ "$HZ" =~ 120.* ]]; then
    exit 0
  fi
  hyprctl keyword monitor "eDP-1,2880x1920@120.00000,0x0,2.0,vrr,1"
  notify-send "Monitor adjusted" "Refresh rate 120" || true
else
  if [[ "$HZ" =~ 60.* ]]; then
    exit 0
  fi
  hyprctl keyword monitor "eDP-1,2880x1920@60.00000,0x0,2.0,vrr,1"
  notify-send "Monitor adjusted" "Refresh rate 60" || true
fi
