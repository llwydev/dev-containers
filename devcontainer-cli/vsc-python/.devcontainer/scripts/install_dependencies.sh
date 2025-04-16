#!/bin/bash

set -e

# Install common dependencies
apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    sudo \
    build-essential \
    lsb-release \
    vim \
    nano \
    curl \
    git \
    gnupg \
    less \
    procps \
    wget \
    unzip \
    zip

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*