#!/bin/bash

step=5

get_brightness() {
  brightnessctl -m | cut -d, -f4 | tr -d '%'
}

send_notification() {
  local brightness=$1

  notify-send -e \
    -h string:x-canonical-private-synchronous:brightness_notif \
    -h int:value:"$brightness" \
    "Screen" "Brightness: ${brightness}%"
}

change_brightness() {
  local step=$1
  brightnessctl -e4 -n2 set $step
  send_notification "$(get_brightness)"
}

case "$1" in
"--get")
  get_brightness
  ;;
"--inc")
  change_brightness "$step%+"
  ;;
"--dec")
  change_brightness "$step%-"
  ;;
*)
  get_brightness
  ;;
esac
