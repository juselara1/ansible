#/bin/bash

generate_keys() {
    pushd ~/.ssh/
    ssh-keygen -t ed25519 -C $1 -f $2 -q -N "" <<< "y" > /dev/null
    echo "Public key for $2:"
    cat "$2.pub" 
    popd
}

setup_folders() {
    [[ ! -d ~/.ssh ]] && mkdir ~/.ssh && chmod 600 ~/.ssh
}

$*
exit 0
