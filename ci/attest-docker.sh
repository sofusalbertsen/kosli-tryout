# needs to add the artifact of the current build to kosli
#!/bin/bash
# This script adds an artifact to Kosli for the current build.
set -e

kosli attest artifact --trail=${GIT_COMMIT} --artifact-type=docker --commit-url=${COMMIT_URL} --commit=${GIT_COMMIT} "ghcr.io/$docker_username/${APP_NAME}:1.0-${GIT_COMMIT::8}" --build-url=${BUILD_URL} --name=micronaut-app