#!/bin/bash

set -e

SCRIPT="${BASH_SOURCE[0]}"
TIMEOUT=5

function notify {
  notify-send \
    --hint=string:synchronous:hyprpaper-control \
    --hint=string:x-dunst-stack-tag:hyprpaper-control \
    "Hyprpaper state: $1" "From $SCRIPT" || true
}

function main {
  ACTION="$1"
  STATE=$(systemctl --no-pager --user show hyprpaper | grep SubState)

  systemctl --user "$ACTION" hyprpaper
  # if started wait for it to be ready
  if [ "$ACTION" == "start" ]; then
    while ! hyprctl hyprpaper listactive >/dev/null 2>&1 && [ "$TIMEOUT" -gt 0 ]; do
      sleep 1
      ((TIMEOUT--))
    done
  fi

  # if it was already running then do not send the notification
  # when start was requested
  if [[ ! "$STATE" =~ .*running.* ]] && [ "$ACTION" == "start" ]; then
    notify "$1"
  fi
}

(
  typeset fd=
  exec {fd}>/tmp/control-hyprpaper.lock
  flock -w 30 $fd || exit 1
  case "$1" in
  start) main start ;;
  stop) main stop ;;
  *) echo "Please enter a systemctl action" ;;
  esac
)
