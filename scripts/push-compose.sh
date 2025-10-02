#!/bin/bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rsync -avh server/ sysadmin:/home/vadrigar/server/ \
    --chown=vadrigar:vadrigar
