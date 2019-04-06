#!/bin/bash

set -e

export MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
export ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh"
export INSTALL_DIR="$HOME"
export TMP_DIR="$INSTALL_DIR/.tmp"

function print-banner () {
    local message="$1"
    echo "##################################"
    echo "$message"
    echo "##################################"
}

function pre-installation () {
    print-banner "Getting conda installation script"
    mkdir -p $TMP_DIR
    if [ $1 == "miniconda" ] ; then
        wget $MINICONDA_URL \
            -O $TMP_DIR/conda.sh
    elif [ $1 == "anaconda" ] ; then
        wget $ANACONDA_URL \
            -O $TMP_DIR/conda.sh
    fi
    chmod +x $TMP_DIR/conda.sh
}

function main () {
    print-banner "Installing conda"
    $TMP_DIR/conda.sh -bf
}

function post-installation () {
    print-banner "Cleanup"
    rm -rf $TMP_DIR
}

if  [ "$UID" -eq 0 ] ; then
    echo "Please do not run as root"
else
    pre-installation "$@"
    main "$@"
    post-installation
fi
