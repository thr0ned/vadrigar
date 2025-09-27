#!/usr/bin/env bash
ROOT_DIR=/home/thr0ne/files/programming/projects/vadrigar
docker build -f ${ROOT_DIR}/docker/Dockerfile.qlds -t qlds:latest ${ROOT_DIR}/docker/
