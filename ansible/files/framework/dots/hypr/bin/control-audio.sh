#!/usr/bin/env bash

DEVICE="$2"

get_volume() {
  wpctl get-volume "$DEVICE" | awk '{print int($2 * 100)}'
}

is_muted() {
  wpctl get-volume "$DEVICE" | grep -q MUTED
}

function notify {
  VOLUME=$(get_volume)
  notify-send \
    -h string:x-dunst-stack-tag:volume \
    -h int:value:"$VOLUME" \
    "Volume $DEVICE" "Set to $VOLUME%"
}

function notify_muted {
  STATUS="unmuted"
  if is_muted; then
    STATUS="muted"
  fi
  notify-send \
    -h string:x-dunst-stack-tag:volume-muted \
    "Device $DEVICE $STATUS"
}

case "$1" in
"--inc")
  if is_muted; then
    wpctl set-mute "$DEVICE" 0
  fi
  wpctl set-volume -l 1 "$DEVICE" 5%+
  notify
  ;;
"--dec")
  wpctl set-volume "$DEVICE" 5%-
  notify
  ;;
"--mute")
  wpctl set-mute "$DEVICE" toggle
  notify_muted
  ;;
"--get")
  get_volume
  ;;
*)
  exit 0
  ;;
esac
