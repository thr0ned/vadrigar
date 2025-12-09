#!/usr/bin/env bash
set -euo pipefail

DOCKER_USER="vadrigar"   # your WSL username

echo "[1/5] Installing prerequisites…"
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https

echo "[2/5] Preparing keyrings…"
sudo install -m 0755 -d /etc/apt/keyrings

echo "[3/5] Adding Docker GPG key…"
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "[4/5] Adding Docker repository…"
DISTRO="$(lsb_release -cs)"  # should be "bookworm"

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
 https://download.docker.com/linux/debian $DISTRO stable" \
 | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get update

echo "[5/5] Installing Docker…"
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "Adding user '$DOCKER_USER' to docker group…"
sudo usermod -aG docker "$DOCKER_USER"

echo
echo "✔ Docker installation complete!"
echo "➡ Close and reopen your WSL terminal (or run: wsl --shutdown)"
echo "   then test with:  docker run hello-world"
