#!/bin/sh
set -e

if [ -z "$(which git)" ]; then
    echo "git is missing, update forced"
    UPSTREAM_HEAD="$(date +%s)"
elif [ "$1" = "--update" ]; then
    UPSTREAM_HEAD="$(date +%s)"
else
    UPSTREAM_HEAD=$(git ls-remote https://github.com/AethirCloud/checker-client.git HEAD)
fi
docker compose build --build-arg UPSTREAM_HEAD="${UPSTREAM_HEAD}"

