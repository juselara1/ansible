#/bin/bash

setup_pyenv() {
    export PATH="$PATH:$HOME/.pyenv/bin/"
    eval "$(pyenv init --path)"
    pyenv install "$1"
    pyenv global "$1"
}

install_pyenv() {
    curl https://pyenv.run | bash
    setup_pyenv "$1"
}

install_poetry() {
    export PATH="$PATH:$HOME/.pyenv/bin/"
    eval "$(pyenv init --path)"
    curl -sSL https://install.python-poetry.org | python -
}

$*
exit 0
