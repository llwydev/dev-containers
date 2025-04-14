#!/bin/bash

# Check if .env file exists in the same directory as the script
ENV_FILE=".env"
if [[ ! -f "$ENV_FILE" ]]; then
    echo "Error: .env file not found in $(dirname "$0")"
    exit 1
fi

# Source the .env file
echo "Loading environment variables from .env file..."
source "$ENV_FILE"
# Check if the .env file was loaded successfully
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to load environment variables from .env file"
    exit 1
fi

# AWS CLI configuration script
echo "Configuring AWS CLI..."

# Set AWS default region if not provided


# AWS configuration
if [ -n "$AWS_ACCESS_KEY_ID" ] && [ -n "$AWS_SECRET_ACCESS_KEY" ]; then
    aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
    aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
    aws configure set output "json" --profile default
    
    if [ -n "$AWS_REGION" ]; then
        aws configure set default.region "$AWS_REGION"
    else
        echo "Warning: AWS_DEFAULT_REGION is not set. Using default region 'eu-west-1'."
        aws configure set default.region "eu-west-1"
    fi

fi

# Create marker file to indicate initialization is complete
touch /tmp/.devcontainer-initialized

# Verify configuration
echo "AWS CLI configuration complete. Current configuration:"
aws configure list --profile default

# Optional: Test configuration with a simple AWS command
echo "Testing AWS configuration..."
aws sts get-caller-identity --profile default

echo "AWS-Cli setup completed successfully."