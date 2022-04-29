#!/bin/bash
setup_folders() {
    local folders=("repositories/config/" ".config/" "repositories/tmp/" "repositories/images/" "repositores/personal/" "repositories/teaching")
    for folder in "${folders[@]}"; do
        [[ ! -d "${folder}" ]] && mkdir -p "$folder"
    done
}

$*
exit 0
