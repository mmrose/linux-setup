#!/bin/bash

read -p "Installing iftop, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get install -y iftop
    fi
fi

