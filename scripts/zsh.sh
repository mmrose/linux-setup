#!/bin/bash

read -p "Installing ZSH, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get install -y zsh
    fi

    [ -e $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.`date +%Y%m%d-%H%M%S`.bak

    cp $( dirname -- "${BASH_SOURCE[0]}" )/../dotfiles/.zshrc $HOME/.zshrc

    read -p "Switch to ZSH? [YyJj] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[YyJj]$ ]]; then
        chsh -s /bin/zsh
        # if GUI is present, then set zsh also there
        if [ -x "$(command -v gsettings)" ]; then
            # find default profile of terminal app
            PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default)
            PROFILE_ID=${PROFILE_ID:1:-1} # remove leading and trailing single quotes
            echo $PROFILE_ID
            # set command
            gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" use-custom-command true
            gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" custom-command "/bin/zsh"
            # set font size smaller
            gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" font "Monospace 10"
            gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" use-system-font false
        fi
    fi
fi

