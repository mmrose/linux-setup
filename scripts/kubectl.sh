#!/bin/bash

read -p "Installing Kubectl, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
  if [ -z ${SKIPTOOLINSTALL+x} ]; then

    read -p "First installation on this machine? [YyJj] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[YyJj]$ ]]; then
      sudo install -m 0755 -d /etc/apt/keyrings
      curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
      sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg 

      # Add the repository to Apt sources:
      # This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
      echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
      sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly
      sudo apt-get update
    fi

    sudo apt-get install -y kubectl
  fi
fi