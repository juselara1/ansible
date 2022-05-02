#!/bin/bash

install_nvim() {
    pushd "/tmp/neovim"
    make install
    popd
}

install_nerdfonts() {
    wget "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf" -O "UbuntuMono.ttf"

    [[ ! -d "$HOME/.local/share/fonts/" ]] && mkdir -p "$HOME/.local/share/fonts/"
    mv "UbuntuMono.ttf" "$HOME/.local/share/fonts/"
    fc-cache -f -v
}

$*
exit 0
