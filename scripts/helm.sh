#!/bin/bash

read -p "Installing Helm, continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]; then
  if [ -z ${SKIPTOOLINSTALL+x} ]; then

    read -p "First installation on this machine? [YyJj] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[YyJj]$ ]]; then
      sudo install -m 0755 -d /etc/apt/keyrings
      curl https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor -o /etc/apt/keyrings/helm-apt-keyring.gpg
      sudo chmod 644 /etc/apt/keyrings/helm-apt-keyring.gpg 

      # Add the repository to Apt sources:
      # This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
      echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/helm-apt-keyring.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
      sudo chmod 644 /etc/apt/sources.list.d/helm-stable-debian.list   # helps tools such as command-not-found to work correctly
      sudo apt-get update
    fi

    sudo apt-get install -y helm
  fi
fi