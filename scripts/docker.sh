#!/bin/bash

read -p "Installing Docker, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
  if [ -z ${SKIPTOOLINSTALL+x} ]; then

    read -p "First installation on this machine? [YyJj] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[YyJj]$ ]]; then
      sudo install -m 0755 -d /etc/apt/keyrings
      sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
      sudo chmod a+r /etc/apt/keyrings/docker.asc

      # Add the repository to Apt sources:
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      sudo apt-get update
    fi

    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -a -G $USER
  fi
fi