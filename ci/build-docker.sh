#!/bin/bash
set -e
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
[[ -z "${docker_username}" ]] && docker_username='local' || docker_username="${docker_username}"
[[ -z "${APP_NAME}" ]] && APP_NAME='micronaut-app' || APP_NAME="${APP_NAME}"
echo "Building Docker image for ${APP_NAME} with tag ${Tag}"
REPO="ghcr.io/$docker_username/"
echo "${REPO}"
docker build -t "${REPO}${APP_NAME}:latest" -t "${REPO}${APP_NAME}:1.0-$Tag" app/
