#!/usr/bin/env bash

# BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"

docker build -f /home/vadrigar/server/Dockerfile.qlds -t qlds:latest /home/vadrigar/server/
