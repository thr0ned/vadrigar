#!/bin/bash
set -euo pipefail

# absolute path of this script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ${BASE_DIR}/ssh-keys/
ssh-keygen -t ed25519  -C "ssh public key for sysadmin" -f ${BASE_DIR}/ssh-keys/sysadmin -N ""
ssh-keygen -t ed25519  -C "ssh public key for vadrigar" -f ${BASE_DIR}/ssh-keys/vadrigar -N ""


