#!/bin/bash
if [ -z ${SKIPTOOLINSTALL+x} ]; then
    read -p "Installing Virtualbox, continue? [YyJj] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[YyJj]$ ]]; then

        read -p "First installation on this machine? [YyJj] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[YyJj]$ ]]; then
            wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor

            echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(. /etc/os-release && echo "$VERSION_CODENAME") contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list > /dev/null
            sudo apt-get update
        fi
    fi
fi