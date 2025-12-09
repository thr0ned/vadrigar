#!/usr/bin/env bash
set -euo pipefail

# Variables
DOCKER_USER="vadrigar"

# Optional: Create docker group if absent
if ! getent group docker >/dev/null; then
    groupadd docker
fi

# Prepare container tools repo, keyrings
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list

apt-get update

# Install required packages (docker, compose, etc)
apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Make sure your user exists, add to docker group
if id "$DOCKER_USER" &>/dev/null; then
    usermod -aG docker "$DOCKER_USER"
    echo "User '$DOCKER_USER' added to docker group."
else
    echo "Error: User '$DOCKER_USER' does not exist. Please create it first."
    exit 1
fi

# Optional: Enable docker for user sessions (WSL: restart required for group perms)
echo "Setup complete. If running under WSL, restart your session to gain docker group permissions."

# Optional: Harden Docker socket permissions (disable write access for other groups/users)
chmod 660 /var/run/docker.sock || true

# Clean up
echo "Complete. You may now use Docker and docker-compose as '$DOCKER_USER'."

# Optionally reboot (Uncomment if desired)
reboot
