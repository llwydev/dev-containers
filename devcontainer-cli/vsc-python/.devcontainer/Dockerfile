FROM python:3.12-slim-bookworm

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

# Install AWS CLI
RUN /tmp/install_aws_cli.sh

# Install Terraform
RUN /tmp/install_terraform.sh

# Clean up scripts
RUN rm -f /tmp/*.sh

# Switch to vscode user
USER vscode
WORKDIR /home/vscode

ENV PIP_NO_CACHE_DIR=1