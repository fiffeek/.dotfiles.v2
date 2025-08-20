#!/bin/bash

set -e

source $HOME/.bin/wallust-reload.sh

WALLPAPER="$1"

function main {
  control-hyprpaper.sh start || true
  hyprctl hyprpaper reload ",$WALLPAPER"
  wallust run "$WALLPAPER" --skip-sequences --threshold=12
  matugen image "$WALLPAPER"
  reload
  notify-send "Theme changed" "$WALLPAPER"
}

(
  typeset fd=
  exec {fd}>$WALLUST_LOCK
  flock -w 30 $fd || exit 1
  main
)
