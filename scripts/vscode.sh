#!/bin/bash
echo "Installing Visual Studio Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/microsoft.gpg
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt-get install code