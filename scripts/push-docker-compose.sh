#!/bin/bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

scp -r ${BASE_DIR}/docker vadrigar:/home/vadrigar

