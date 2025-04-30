# This Dockerfile is used to create a development container for Visual Studio Code.
# It installs necessary tools and dependencies for development.
# Use the official Python image as a base

FROM python:3.9-slim

# Copy scripts to container
COPY /scripts/*.sh /tmp/

# Make scripts executable
RUN chmod +x /tmp/*.sh

# Install dependencies
RUN /tmp/install_dependencies.sh

# Create vscode user
RUN /tmp/create_user_vscode.sh

# Install postgresql client
RUN /tmp/install_cli_psql.sh

# Install Docker CLI
RUN /tmp/install_cli_docker.sh

# Install AWS CLI
RUN /tmp/install_cli_aws.sh

# Install Terraform
RUN /tmp/install_cli_terraform.sh

# Clean up scripts
RUN rm -f /tmp/*.sh

# Switch to vscode user
USER vscode

# Set the working directory
WORKDIR /home/vscode

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Set the environment variable to non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

# Set the default Python environment to use pip
ENV PIP_NO_CACHE_DIR=1

# Set the default locale to UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Set the default timezone to UTC
ENV TZ=UTC

# Set the default editor to code
ENV EDITOR=code