#!/bin/bash

set -e

source $HOME/.bin/wallust-reload.sh

THEME="${1:-"github"}"

function main {
  control-hyprpaper.sh stop || true
  wallust cs "$THEME" --skip-sequences
  matugen color hex "$(cat ~/.config/matugen/generated-colors)"
  reload
  notify-send "Theme changed" "$THEME"
}

(
  typeset fd=
  exec {fd}>$WALLUST_LOCK
  flock -w 30 $fd || exit 1
  main
)
