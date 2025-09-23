#!/bin/bash

# run server in a tmux session
tmux new-session -d -s qlds "source /mnt/data.tmux.conf; /mnt/data/qlds/run_server_x64_minqlx.sh +set fs_homepath /mnt/data/quakelive-homepath +set qlds1"

# keep the docker container alive
tail -f /dev/null

