#!/bin/bash

# Update system package list
sudo apt update -y

# Install curl
sudo apt install curl -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install k3d (Kubernetes in Docker)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install kubectl (Kubernetes command-line tool)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Print completion message
rm -rf get-docker.sh
echo "Installation completed! Reboot your machine or log out/log in again to apply changes."