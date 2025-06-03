#!/bin/bash

# Ensure the script is run as root
if [ "$(whoami)" != "root" ]; then
  echo "Please run this script with sudo:"
  echo "sudo $0"
  exit 1
fi

# Update and install packages
apt-get update
apt-get install -y xrdp xfce4 xfce4-terminal

# Configure xrdp to use xfce4
sed -i.bak '/fi/a #xrdp multiple users configuration \nstartxfce4\n' /etc/xrdp/startwm.sh

# Restart xrdp service
/etc/init.d/xrdp restart

# Add user 'lwmda' if it doesn't already exist
if id "lwmda" &>/dev/null; then
  echo "User 'lwmda' already exists."
else
  adduser lwmda
fi
