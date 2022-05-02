#!/bin/bash

install_nvim() {
    pushd "/tmp/neovim"
    make install
    popd
}

$*
exit 0
