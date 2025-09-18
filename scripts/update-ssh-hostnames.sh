#!/bin/bash
set -euo pipefail

# Absolute path of this script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# source .env variables
source ${BASE_DIR}/settings.env

mkdir -p ~/.ssh/hosts.d/

# add quick host name to ssh config
tee > ~/.ssh/hosts.d/sysadmin-hostinfo.conf << END
Host sysadmin
    HostName ${REMOTE_IP}
    User sysadmin
    Port 22
    IdentityFile ${BASE_DIR}/ssh-keys/sysadmin
END

# Add vadrigar to quick hosts
tee > ~/.ssh/hosts.d/vadrigar-hostinfo.conf << END
Host vadrigar
    HostName ${REMOTE_IP}
    User vadrigar
    Port 22
    IdentityFile ${BASE_DIR}/ssh-keys/vadrigar
END

