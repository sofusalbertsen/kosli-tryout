#!/bin/bash
set -e
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin
docker push "ghcr.io/$docker_username/${APP_NAME}:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$docker_username/${APP_NAME}:latest" &
wait
