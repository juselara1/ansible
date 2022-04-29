#/bin/bash

install_pyenv() {
    curl https://pyenv.run | bash
}

install_poetry() {
    curl -sSL https://install.python-poetry.org | python -
}

$*
exit 0
