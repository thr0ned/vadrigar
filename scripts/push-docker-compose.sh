#!/bin/bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scp -r ${BASE_DIR}/docker vadrigar:/home/vadrigar

ssh vadrigar "cd /home/vadrigar/docker && /home/vadrigar/docker/scripts/build.sh"

