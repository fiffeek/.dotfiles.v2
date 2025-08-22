#!/bin/bash

set -e

source $HOME/.bin/wallust-reload.sh

WALLPAPER="$1"
WALLUST_OPTIONS_CACHE="$XDG_CACHE_HOME/wallust/options/last_applied"
EXTRA_ARGS="${*:2}"

function main {
  control-hyprpaper.sh start || true
  hyprctl hyprpaper reload ",$WALLPAPER"
  wallust-wrapper.sh run "$WALLPAPER" $EXTRA_ARGS
  matugen image "$WALLPAPER"
  reload
  if [ -f "$WALLUST_OPTIONS_CACHE" ]; then
    EXTRA_ARGS="$(tail -n 1 "$WALLUST_OPTIONS_CACHE")"
  fi
  notify_theme_changed "$WALLPAPER" "$EXTRA_ARGS"
}

(
  typeset fd=
  exec {fd}>$WALLUST_LOCK
  flock -w 30 $fd || exit 1
  main
)
