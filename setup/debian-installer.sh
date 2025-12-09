#!/usr/bin/env bash
set -euo pipefail

DOCKER_USER="vadrigar"   # your WSL username

# --- Install required base packages ---
echo "[1/6] Installing prerequisites…"
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common

# --- Create keyrings directory ---
echo "[2/6] Preparing keyrings…"
sudo install -m 0755 -d /etc/apt/keyrings

# --- Add Docker GPG key ---
echo "[3/6] Adding Docker GPG key…"
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# --- Add Docker repository ---
echo "[4/6] Adding Docker repository…"
DISTRO="$(lsb_release -cs)"  # should be "bookworm" for Debian 12
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
 https://download.docker.com/linux/debian $DISTRO stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# --- Update package list ---
sudo apt-get update

# --- Install Docker Engine & tools ---
echo "[5/6] Installing Docker…"
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# --- Add user to docker group ---
echo "[6/6] Adding user to docker group…"
if id "$DOCKER_USER" &>/dev/null; then
    sudo usermod -aG docker "$DOCKER_USER"
else
    echo "Error: user '$DOCKER_USER' not found."
    exit 1
fi

echo ""
echo "✔ Docker installation complete!"
echo "➡ Close and reopen your WSL terminal"
echo "   to apply the docker group permissions."
echo ""
echo "Test with:  docker run hello-world"
