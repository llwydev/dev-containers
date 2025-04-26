#!/bin/bash

# Update package list and install prerequisites
sudo apt-get update
sudo apt-get install -y wget gnupg2

# Import the PostgreSQL signing key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Add PostgreSQL APT repository
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

# Update package list again and install PostgreSQL client
sudo apt-get update
sudo apt-get install -y postgresql-client

