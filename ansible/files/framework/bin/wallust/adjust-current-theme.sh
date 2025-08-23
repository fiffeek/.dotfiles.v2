#!/bin/bash

set -e

EXTRA_WALLUST_ARGS="${1}"
EXTRA_MATUGEN_ARGS="${2}"

if [ -z "$EXTRA_WALLUST_ARGS" ] && [ -z "$EXTRA_MATUGEN_ARGS" ]; then
  echo "needed extra arguments to overwrite the defaults"
  exit 1
fi

CURRENT_COLORSCHEME_FILE="$XDG_CACHE_HOME/wallust/current_colorscheme"
if [ -f "$CURRENT_COLORSCHEME_FILE" ]; then
  CURRENT_CS=$(cat "$CURRENT_COLORSCHEME_FILE")
  wallust-solid-theme.sh "$CURRENT_CS" "$EXTRA_WALLUST_ARGS" "$EXTRA_MATUGEN_ARGS"
  exit 0
fi

CURRENT_WALL=$(hyprctl hyprpaper listloaded || echo "placeholder")
if [ "$CURRENT_WALL" != "placeholder" ]; then
  wallust-wallpaper-theme.sh "$CURRENT_WALL" "$EXTRA_WALLUST_ARGS" "$EXTRA_MATUGEN_ARGS"
  exit 0
fi

echo "cant pull the current wallpaper"
exit 1
