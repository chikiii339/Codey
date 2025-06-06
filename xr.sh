#!/bin/bash

# Download Chrome Remote Desktop
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb

# Install the .deb package
sudo apt install -y ./chrome-remote-desktop_current_amd64.deb

# Update packages
sudo apt update

# Fix broken installs if any
sudo apt --fix-broken install -y

# Add the chrome-remote-desktop group
sudo groupadd chrome-remote-desktop

# Add your user to the group (replace lwmda with your actual user if different)
sudo usermod -aG chrome-remote-desktop lwmda

echo "✅ Chrome Remote Desktop setup script complete."
