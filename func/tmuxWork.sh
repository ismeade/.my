#!/bin/bash

openWork() {
    tmux a -t $1
}

newWork(){
    workdir="$2"
    tmux new -s $1 -d
    tmux rename-window -t "$1:1" rc
    tmux send -t "$1:rc" "cd ${workdir}" Enter
    tmux split-window -h -t "work:rc"
    tmux send -t "$1:rc" "cd ${workdir};lg" Enter
    tmux select-pane -L
    tmux a -t $1
}

tmuxOpenWork() {
    name="$1"
    has=0

    while IFS= read -r line; do
        if [ "$line" == "${name}" ]; then
            has=1
            break
        fi
    done <<< "$(tmux ls -F\#S)"

    if [ $has == 1 ]; then
        openWork $*
    else
        newWork $*
    fi
}

tmuxOpenWork $*
