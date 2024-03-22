#!/bin/bash

read -p "Installing htop, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get install -y htop
    fi

    [ -e $HOME/.config/htop/htoprc ] && mv $HOME/.config/htop/htoprc $HOME/.config/htop/htoprc.`date +%Y%m%d-%H%M%S`.bak

    cp $( dirname -- "${BASH_SOURCE[0]}" )/../.config/htop/htoprc $HOME/.config/htop/htoprc
fi

