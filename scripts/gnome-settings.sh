#!/bin/bash

read -p "Installing Gnome modifications, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get install -y gnome-weather
    fi

    ### calendar
    gsettings set org.gnome.desktop.calendar show-weekdate true

    ### dock
    # dock on every monitor
    gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
    # only icons from the current monitor
    gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true
    # only contain icons from the workspace
    gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspace true
    # dock to the bottom
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
    # do not use the full width
    gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
    # reduce icon sice
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
    # show mounts and trash
    gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
    gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true

    ### weather
    gsettings set org.gnome.shell.weather automatic-location true 
fi