#!/bin/bash

set -e

# Install dependencies
apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg

# Add Docker's official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker-ce-cli (not the full docker-ce package)
apt-get update
apt-get install -y --no-install-recommends docker-ce-cli

# Add the current user to the docker group
if ! id -nG "vscode" | grep -qw docker; then
    groupadd docker
    usermod -aG docker vscode
fi