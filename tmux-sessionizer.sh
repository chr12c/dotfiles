#!/bin/bash

# Require TMUX_SESSIONIZER_DIR to be set and exist
if [[ -z "$TMUX_SESSIONIZER_DIR" ]]; then
    tmux display-message -d 5000 "Error: TMUX_SESSIONIZER_DIR is not set. Define it in your shell config to enable." >&2
    exit 1
fi

# Require TMUX_SESSIONIZER_DIR to be a valid directory path
if [[ ! -d "$TMUX_SESSIONIZER_DIR" ]]; then
    tmux display-message -d 5000 "Error: TMUX_SESSIONIZER_DIR '$TMUX_SESSIONIZER_DIR' does not exist." >&2
    exit 1
fi

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find "$TMUX_SESSIONIZER_DIR" -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" 
    tmux send-keys -t "$selected_name" "cd \"$selected\" && clear" C-m
fi

tmux switch-client -t $selected_name
