#!/usr/bin/env bash
set -euo pipefail

DOCKER_USER="vadrigar"

# Create docker group if absent
if ! getent group docker >/dev/null; then
    sudo groupadd docker
fi

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg |
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian $(lsb_release -cs) stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get update

sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

if id "$DOCKER_USER" &>/dev/null; then
    sudo usermod -aG docker "$DOCKER_USER"
    echo "User '$DOCKER_USER' added to docker group."
else
    echo "Error: User '$DOCKER_USER' does not exist."
    exit 1
fi

sudo chmod 660 /var/run/docker.sock || true

echo "Setup complete. Restart WSL to apply group changes."
