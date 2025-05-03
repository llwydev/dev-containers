#!/bin/bash

set -e

# Create vscode user with UID/GID 1000
if ! id -u vscode >/dev/null 2>&1; then
    groupadd --gid 1000 vscode
    useradd --uid 1000 --gid 1000 -m vscode
    echo "Created vscode user (UID/GID 1000)"
else
    echo "vscode user already exists"
fi

# Add vscode to sudo group
usermod -aG sudo vscode

# Create docker group if it doesn't exist and add vscode user
groupadd -f docker
usermod -aG docker vscode

# Configure passwordless sudo for vscode user
echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode
chmod 0440 /etc/sudoers.d/vscode

# Ensure home directory exists and is owned by vscode
mkdir -p /home/vscode
chown -R vscode:vscode /home/vscode