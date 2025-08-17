#!/bin/bash

THEME="${1:-"Github-Dark"}"

function reload {
  makoctl reload
  systemctl --user restart waybar-top
  kill -SIGUSR1 "$(pidof kitty)"
}

wallust theme "$THEME" --skip-sequences
reload
