#!/bin/zsh

set -ex

function notify {
  notify-send \
    --hint=string:synchronous:hypr-config \
    --hint=string:x-dunst-stack-tag:hypr-config \
    "Hyprland config change" "$1 config" || true
}

function adjust_settings {
  SETTING="$1"
  NOTIFICATION="$2"

  hyprctl keyword decoration:blur:enabled $SETTING
  hyprctl keyword decoration:shadow:enabled $SETTING
  hyprctl keyword animations:enabled $SETTING
  notify "$NOTIFICATION"
}

timeout=60

while ! hyprctl monitors >/dev/null 2>&1 && [ "$timeout" -gt 0 ]; do
  sleep 1
  ((timeout--))
done

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)

adjust-refresh-rate.sh

if [ "$POWER_STATUS" -eq 1 ]; then
  adjust_settings "true" "AC"
else
  adjust_settings "false" "BAT"
fi
