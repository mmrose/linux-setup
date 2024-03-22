#!/bin/bash

read -p "Installing base tools, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
    if [ -z ${SKIPTOOLINSTALL+x} ]; then
        sudo apt-get update
        sudo apt-get install -y ca-certificates curl git curl vlc
    fi
fi