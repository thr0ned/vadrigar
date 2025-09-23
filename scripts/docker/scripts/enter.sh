#!/usr/bin/env bash

# docker run -it --entrypoint /bin/bash pqlserver
docker run -it -v ./data:/mnt/data --entrypoint /bin/bash pqlserver:latest
