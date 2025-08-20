#!/bin/bash

source $HOME/.bin/wallust-reload.sh

set -e

THEME="${1:-"github"}"
control-hyprpaper.sh stop || true
wallust cs "$THEME" --skip-sequences
matugen color hex "$(cat ~/.config/matugen/generated-colors)"
reload
notify-send "Theme changed" "$THEME"
