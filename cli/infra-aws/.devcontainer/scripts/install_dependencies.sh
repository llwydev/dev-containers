#!/bin/bash

set -e

# Install common dependencies
apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    lsb-release \
    procps \
    software-properties-common \
    sudo \
    unzip \
    vim \
    wget \
    zip
