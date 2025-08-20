#!/bin/bash

source $HOME/.bin/wallust-reload.sh

set -e

THEME="${1:-"github"}"
systemctl --user stop hyprpaper || true
wallust cs "$THEME" --skip-sequences
matugen color hex "$(cat ~/.config/matugen/generated-colors)"
reload
notify-send "Theme changed" "$THEME"
