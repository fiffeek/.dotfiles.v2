#!/bin/bash

set -e

source $HOME/.bin/wallust-reload.sh

THEME="${1:-"github"}"
EXTRA_ARGS="${*:2}"

function main {
  control-hyprpaper.sh stop || true
  wallust-wrapper.sh colorscheme "$THEME" $EXTRA_ARGS
  matugen color hex "$(cat ~/.config/matugen/generated-colors)"
  reload
  notify_theme_changed "$THEME" "$EXTRA_ARGS"
}

(
  typeset fd=
  exec {fd}>$WALLUST_LOCK
  flock -w 30 $fd || exit 1
  main
)
