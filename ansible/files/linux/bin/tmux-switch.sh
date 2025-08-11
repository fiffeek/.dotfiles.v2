#!/usr/bin/env bash

REPOS="$HOME/repos"
PERSONAL="$HOME/personal"
export TMUX_FZF_OPTIONS="-p -w 62% -h 38% -m"

# Combined:
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
# https://github.com/sainnhe/tmux-fzf/blob/master/scripts/session.sh

tmuxp_saved_sessions=$(tmuxp ls)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  current_sessions=$(tmux list-sessions -F "#{session_name} #{session_last_attached}" 2>/dev/null |
    sort -k2 -nr |
    awk '{print $1}')
  repos=$(find "$REPOS" -mindepth 1 -maxdepth 1 -printf "%f\n")
  personal=$(find "$PERSONAL" -mindepth 1 -maxdepth 1 -printf "%f\n")
  options=($current_sessions "${repos[@]}" "${tmuxp_saved_sessions[@]}" "${personal[@]}")
  options=($(printf "%s\n" "${options[@]}" | awk '!seen[$0]++'))
  # https://github.com/junegunn/fzf/issues/1693
  selected=$(printf "%s\n" "${options[@]}" | fzf-tmux --bind=enter:replace-query+print-query $TMUX_FZF_OPTIONS --preview="tmux capture-pane -ep -t {}")
fi

if [ -z $selected ]; then
  exit 0
fi

session_name=$(basename ${selected} | tr . _)
dir="$REPOS/$selected"
# some sessions do not have clearly defined cwd
if [ ! -d "${dir}" ]; then
  dir="$HOME"
fi

tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $session_name -c $dir
  exit 0
fi

if ! tmux has-session -t=$session_name 2>/dev/null; then
  if [[ " ${tmuxp_saved_sessions[*]} " =~ [[:space:]]${session_name}[[:space:]] ]]; then
    tmuxp load -d $session_name >/dev/null 2>&1
  fi
  tmux new-session -ds $session_name -c $dir
fi

tmux switch-client -t $session_name
