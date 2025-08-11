#!/usr/bin/env bash

export TMUX_FZF_OPTIONS="-p -w 62% -h 38% -m"

current_windows=$(tmux list-windows -a -F "#S:#W")
options=($current_windows)
selected=$(printf "%s\n" "${options[@]}" | fzf-tmux --bind=enter:replace-query+print-query $TMUX_FZF_OPTIONS --preview="tmux capture-pane -ep -t {}")

if [ -z $selected ]; then
	exit 0
fi

if ! tmux has-session -t $selected 2>/dev/null; then
	tmux new-window -dn $selected
fi

echo "$selected" | sed 's/:.*//g' | xargs -I{} tmux switch-client -t {}
tmux select-window -t $selected
