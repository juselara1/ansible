#!/bin/bash

install_nvim() {
    pushd "/tmp/neovim"
    make install
    popd
}

install_rustup() {
    curl https://sh.rustup.rs -sSf | sh -s -- -y
}

install_just() {
    pushd "/tmp/just"
    make clean install
    popd
}

install_nerdfonts() {
    wget "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf" -O "UbuntuMono.ttf"

    [[ ! -d "$HOME/.local/share/fonts/" ]] && mkdir -p "$HOME/.local/share/fonts/"
    mv "UbuntuMono.ttf" "$HOME/.local/share/fonts/"
    fc-cache -f -v
}

install_qtile() {
    pushd "$HOME/.config/qtile/"
    export PATH="$PATH:$HOME/.local/bin/"
    poetry config virtualenvs.in-project true 
    poetry install
    popd
}

install_starship() {
    curl -sS https://starship.rs/install.sh > /tmp/starship.sh
    chmod +x /tmp/starship.sh
    /tmp/starship.sh -y
}

install_alacritty() {
    pushd "/tmp/alacritty"
    source "/root/.cargo/env"
    cargo build --release
    mv 'target/release/alacritty' '/usr/local/bin/alacritty'
    popd
}

$*
exit 0
