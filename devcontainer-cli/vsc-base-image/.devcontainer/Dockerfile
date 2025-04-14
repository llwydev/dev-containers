FROM debian:12

# Copy scripts to container
COPY /scripts/*.sh /tmp/

# Make scripts executable
RUN chmod +x /tmp/*.sh

# Install dependencies
RUN /tmp/install_dependencies.sh

# Create vscode user
RUN /tmp/create_vscode_user.sh

# Install Docker CLI
RUN /tmp/install_docker_cli.sh

# Install kubectl
RUN /tmp/install_kubectl.sh

# Clean up scripts
RUN rm -f /tmp/create_vscode_user.sh /tmp/install_docker_cli.sh /tmp/install_kubectl.sh /tmp/install_dependencies.sh


# Switch to vscode user
USER vscode
WORKDIR /home/vscode