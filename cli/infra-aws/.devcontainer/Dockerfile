# This Dockerfile is used to create an aws infra deployment container for Visual Studio Code

# Pull base image
FROM debian:stable-slim

# Copy scripts to container
COPY /scripts/*.sh /tmp/

# Make scripts executable
RUN chmod +x /tmp/*.sh

# Install dependencies
RUN /tmp/install_dependencies.sh

# Create vscode user
RUN /tmp/add_user.sh

# Install Docker CLI
RUN /tmp/install_cli_docker.sh

# Install AWS CLI
RUN /tmp/install_cli_aws.sh

# Install Terraform CLI
RUN /tmp/install_cli_terraform.sh

# Clean up temp files & apt cache
RUN /tmp/cleanup.sh

# Switch to vscode user
USER vscode

# Set the working directory
WORKDIR /home/vscode

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Set the default locale to UTF-8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8