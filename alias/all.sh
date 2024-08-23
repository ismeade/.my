#!/bin/bash

alias vim="nvim"
alias lg="lazygit"
alias pa="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;"
alias pd="unset http_proxy; unset https_proxy;"

alias fy="fanyi"

alias redis-cli="docker run -ti --rm --network host redis:6.2.5-alpine redis-cli"

alias dm="docker run --workdir /data -ti --rm -v /Users/liyang/Data/mysql/:/data mariadb:10.9 /bin/bash"

alias kc="kubectl"

#alias work="tmuxOpenWork work /Users/liyang/projects/nancal/release-center/release-packaging-platform-java"
alias rc="sh ~/.my/func/tmuxWork.sh work /Users/liyang/projects/nancal/release-center/release-packaging-platform-java"

alias code="sh ~/.my/func/tmux_code.sh"
