#!/bin/bash

set -e

source $HOME/.bin/wallust-reload.sh

WALLPAPER="$1"
WALLUST_OPTIONS_CACHE="$XDG_CACHE_HOME/wallust/options/last_applied"
MATUGEN_OPTIONS_CACHE="$XDG_CACHE_HOME/matugen/options/last_applied"
EXTRA_WALLUST_ARGS="${2}"
EXTRA_MATUGEN_ARGS="${3}"

function send_notification {
  WALLUST_EXTRA_ARGS="default"
  if [ -f "$WALLUST_OPTIONS_CACHE" ]; then
    WALLUST_EXTRA_ARGS="$(tail -n 1 "$WALLUST_OPTIONS_CACHE")"
  fi
  MATUGEN_EXTRA_ARGS="default"
  if [ -f "$MATUGEN_OPTIONS_CACHE" ]; then
    MATUGEN_EXTRA_ARGS="$(tail -n 1 "$MATUGEN_OPTIONS_CACHE")"
  fi
  notify_theme_changed "$WALLPAPER" \
    " wallust: $WALLUST_EXTRA_ARGS\n matugen: $MATUGEN_EXTRA_ARGS"
}

function main {
  control-hyprpaper.sh start || true
  hyprctl hyprpaper reload ",$WALLPAPER"
  wallust-wrapper.sh run "$WALLPAPER" $EXTRA_WALLUST_ARGS
  matugen-wrapper.sh image "$WALLPAPER" $EXTRA_MATUGEN_ARGS
  reload
  send_notification
}

(
  typeset fd=
  exec {fd}>$WALLUST_LOCK
  flock -w 30 $fd || exit 1
  main
)
