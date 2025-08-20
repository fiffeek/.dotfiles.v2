#!/bin/bash

function reload_tmux {
  if command -v tmux >/dev/null 2>&1; then
    if tmux list-sessions -F '#S' >/dev/null 2>&1; then
      tmux source-file ~/.config/tmux/tmux.conf \; refresh-client -S \; display-message 'tmux: config reloaded'
    fi
    # reload any zsh pane
    tmux list-panes -s -a -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" |
      while read -r pane_process; do
        IFS=' ' read -ra pane_process <<<"$pane_process"
        if [[ "${pane_process[1]}" == "zsh" ]]; then
          tmux send-keys -t "${pane_process[0]}" "source ~/.zshrc" C-m
        fi
      done
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
  reload_tmux
}
