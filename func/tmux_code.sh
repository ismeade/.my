#!/bin/bash

# 执行命令
current_dir=$(basename "$PWD")
session_name=$(echo "${current_dir}" | sed 's/\./_/g')

# 打印结果
echo "当前目录名称是：${current_dir}"
echo "session_name: ${session_name}"

# 判断是否有work的session

hasWork=0
while IFS= read -r line; do
    if [ "$line" == "${session_name}" ]; then
        hasWork=1
        break
    fi
done <<< "$(tmux ls -F\#S 2> /dev/null)"

hasGit=0
# 判断是否有个.git
# if [ -d ".git" ]; then
#   hasGit=1
# fi

if [ $hasWork == 0 ]; then
    echo "创建session" ${session_name}
    tmux new -s ${session_name} -d
    tmux split-window -h -t "${session_name}:1"
    tmux resizep -R 5
    if [ $hasGit == 1 ]; then
        tmux send -t "${session_name}:1" "lazygit" Enter
        tmux split-window -v -t "${session_name}:1"
        tmux resizep -D 5
    fi
    tmux select-pane -L
    if [ $# == 0 ]; then
        tmux send -t "${session_name}:1" "vim ." Enter
    fi

fi

tmux attach -t ${session_name}

# case $1 in
#     idea) tmux send -t "${session_name}:1" "idea ." Enter
#     ;;
# esac
