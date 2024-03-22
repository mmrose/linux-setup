#!/bin/bash

read -p "Installing ZSH, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get install -y zsh
    fi

    [ -e $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.`date +%Y%m%d-%H%M%S`.bak

    cp $( dirname -- "${BASH_SOURCE[0]}" )/../dotfiles/.zshrc $HOME/.zshrc
fi

