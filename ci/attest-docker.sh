# needs to add the artifact of the current build to kosli
#!/bin/bash
# This script adds an artifact to Kosli for the current build.
set -e
# set all variables if not set
if [ -z "$GIT_COMMIT" ]; then
    GIT_COMMIT=$(git rev-parse HEAD)
fi
if [ -z "$BUILD_URL" ]; then
    BUILD_URL="https://example.com/build/${GIT_COMMIT}"
fi
if [ -z "$docker_username" ]; then
    docker_username="sofusalbertsen"
fi
if [ -z "$APP_NAME" ]; then
    APP_NAME="kosli-tryout"
fi
if [ -z "$COMMIT_URL" ]; then
    COMMIT_URL=$(git config --get remote.origin.url)
fi
if [ -z "$KOSLI_ORG" ]; then
    KOSLI_ORG="sofusalbertsen"
fi
if [ -z "$KOSLI_FLOW" ]; then
    export KOSLI_FLOW="micronaut"
fi
  
kosli attest artifact --trail=${GIT_COMMIT} --artifact-type=docker --commit-url=${COMMIT_URL} --commit=${GIT_COMMIT} "ghcr.io/$docker_username/${APP_NAME}:1.0-${GIT_COMMIT::8}" --build-url=${BUILD_URL} --name=micronaut-app