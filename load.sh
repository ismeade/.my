#!/bin/bash

#find ~/.my -name "*.sh" -exec echo {} \;

current_dir=$(dirname "$(readlink -f "$0")")
source ${current_dir}/*/*.sh
