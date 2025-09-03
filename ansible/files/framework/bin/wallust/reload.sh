#!/bin/bash

set -o pipefail
set -eux

WALLUST_LOCK=/tmp/wallust-wallpaper.lock

function reload_tmux {
  if command -v tmux >/dev/null 2>&1; then
    if tmux list-sessions -F '#S' >/dev/null 2>&1; then
      tmux source-file ~/.config/tmux/tmux.conf \; refresh-client -S \; display-message 'tmux: config reloaded'
    fi
    # reload any zsh pane
    tmux list-panes -a -F '#{pane_id} #{pane_current_command} #{pane_in_mode}' |
      while read -r pane_id cmd in_mode; do
        # avoid panes in copy mode
        [[ "$cmd" == zsh && "$in_mode" != 1 && "$pane_id" != "${TMUX_PANE:-""}" ]] &&
          tmux send-keys -t "$pane_id" 'source ~/.p10k.zsh; clear' C-m
      done
  fi
}

function reload_obsidian {
  if pgrep -fa '(obsidian|com\.obsidian\.Obsidian|appimage.*[Oo]bsidian)' >/dev/null; then
    xdg-open 'obsidian://adv-uri?action=command&commandid=app%3Areload'
  fi
}

function reload_gtk {
  gsettings set org.gnome.desktop.interface gtk-theme ""
  gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3
}

function reload {
  makoctl reload
  systemctl --user restart waybar-top
  reload_gtk
  kill -SIGUSR1 "$(pidof kitty)"
  hyprctl reload
  pywalfox update
  reload_obsidian
  wallust-calibre.sh --theme ~/.config/calibre/matugen.calibre-palette
  reload_tmux || true
}

function notify_theme_changed {
  local target extra
  target="$1"
  extra="${2:-"default args"}"

  notify-send \
    --hint=string:synchronous:theme-changed \
    --hint=string:x-dunst-stack-tag:theme-changed \
    "Theme changed" "$target\n$extra"
}
