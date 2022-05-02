#!/bin/bash
setup_folders() {
    local folders=(".config/" "repositories/tmp/" "repositories/images/" "repositories/personal/" "repositories/teaching")
    for folder in "${folders[@]}"; do
        [[ ! -d "${folder}" ]] && mkdir -p "$folder"
    done
}

$*
exit 0
