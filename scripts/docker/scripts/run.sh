#!/usr/bin/env bash

# docker run -it --entrypoint /bin/bash pqlserver
docker compose down && docker compose up --build qlds --watch qlds
