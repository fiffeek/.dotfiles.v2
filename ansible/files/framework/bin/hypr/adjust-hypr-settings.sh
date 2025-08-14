#!/bin/zsh

set -ex

timeout=60

while ! hyprctl monitors >/dev/null 2>&1 && [ "$timeout" -gt 0 ]; do
  sleep 1
  ((timeout--))
done

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)

adjust-refresh-rate.sh

if [ "$POWER_STATUS" -eq 1 ]; then
  hyprctl keyword decoration:blur:enabled true
  hyprctl keyword decoration:shadow:enabled true
  hyprctl keyword animations:enabled true
  notify-send "Hyprland AC" || true
else
  hyprctl keyword decoration:blur:enabled false
  hyprctl keyword decoration:shadow:enabled false
  hyprctl keyword animations:enabled false
  notify-send "Hyprland BAT" || true
fi
