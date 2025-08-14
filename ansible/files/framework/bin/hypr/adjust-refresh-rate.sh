#!/bin/zsh

set -x

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)

if [ "$POWER_STATUS" -eq 1 ]; then
  hyprctl keyword monitor "eDP-1,2880x1920@120.00000,0x0,2.0,vrr,1"
  notify-send "Refresh rate 120" || true
else
  hyprctl keyword monitor "eDP-1,2880x1920@60.00000,0x0,2.0,vrr,1"
  notify-send "Refresh rate 60" || true
fi
