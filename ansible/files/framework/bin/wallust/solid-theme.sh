#!/bin/bash

set -e

THEME="${1:-"github-dark-16"}"

function reload {
  makoctl reload
  systemctl --user restart waybar-top
  kill -SIGUSR1 "$(pidof kitty)"
  hyprctl reload

  if command -v tmux >/dev/null 2>&1; then
    if tmux list-sessions -F '#S' >/dev/null 2>&1; then
      tmux source-file ~/.config/tmux/tmux.conf \; refresh-client -S \; display-message 'tmux: config reloaded'
    fi
  fi
}

wallust cs "$THEME" --skip-sequences
matugen color hex "$(cat ~/.config/matugen/generated-colors)"
reload
notify-send "Theme changed" "$THEME"
