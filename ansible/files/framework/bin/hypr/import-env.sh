#!/usr/bin/env bash
set -e

[[ -n $HYPRLAND_DEBUG_CONF ]] && exit 0
USAGE="\
Import environment variables

Usage: $0 <command>

Commands:
   tmux         import to tmux server
   system       import to systemd and dbus user session
   help         print this help
"

_critical_envs=(
  # display
  WAYLAND_DISPLAY
  DISPLAY
  # hyprland
  HYPRLAND_CMD
  HYPRLAND_INSTANCE_SIGNATURE
)

_envs=(
  # display
  WAYLAND_DISPLAY
  DISPLAY
  # xdg
  USERNAME
  XDG_BACKEND
  XDG_CURRENT_DESKTOP
  XDG_SESSION_TYPE
  XDG_SESSION_ID
  XDG_SESSION_CLASS
  XDG_SESSION_DESKTOP
  XDG_SEAT
  XDG_VTNR
  # hyprland
  HYPRLAND_CMD
  HYPRLAND_INSTANCE_SIGNATURE
  # misc
  XCURSOR_SIZE
  # toolkit
  _JAVA_AWT_WM_NONREPARENTING
  QT_QPA_PLATFORM
  QT_WAYLAND_DISABLE_WINDOWDECORATION
  GRIM_DEFAULT_DIR
  # ssh
  SSH_AUTH_SOCK
)

case "$1" in
system)
  dbus-update-activation-environment --systemd "${_envs[@]}"
  ;;
tmux)
  for v in "${_envs[@]}"; do
    if [[ -n ${!v} ]]; then
      tmux setenv -g "$v" "${!v}"
    fi
  done
  for v in "${_critical_envs[@]}"; do
    tmux list-panes -s -a -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" |
      while read -r pane_process; do
        IFS=' ' read -ra pane_process <<<"$pane_process"
        if [[ "${pane_process[1]}" == "zsh" || "${pane_process[1]}" == "bash" ]]; then
          tmux send-keys -t "${pane_process[0]}" "export $v=${!v}" C-m
        fi
      done
  done
  ;;
help)
  echo -n "$USAGE"
  exit 0
  ;;
*)
  echo "operation required"
  echo "use \"$0 help\" to see usage help"
  exit 1
  ;;
esac
