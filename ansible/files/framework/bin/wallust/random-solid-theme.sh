#!/bin/bash

set -o pipefail
set -eux

WALLUST_THEME_DIR="$HOME/.config/wallust/colorschemes/"
THEME=$(find "$WALLUST_THEME_DIR" -type f -name "*.json" | shuf -n 1 | sed 's/.json//g')

wallust-solid-theme.sh "$THEME"
