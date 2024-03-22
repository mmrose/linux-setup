#!/bin/bash

read -p "Installing tmux, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get install -y tmux
    fi

    [ -e $HOME/.tmuxrc ] && mv $HOME/.tmuxrc $HOME/.tmuxrc.`date +%Y%m%d-%H%M%S`.bak

    cp $( dirname -- "${BASH_SOURCE[0]}" )/../dotfiles/.tmuxrc $HOME/.tmuxrc
fi