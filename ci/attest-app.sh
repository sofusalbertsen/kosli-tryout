# needs to add the artifact of the current build to kosli
#!/bin/bash
# This script adds an artifact to Kosli for the current build.
set -e

kosli attest artifact --trail=${GIT_COMMIT} --artifact-type=file --commit-url=${COMMIT_URL} --commit=${GIT_COMMIT} app/build/libs/app-0.1-all.jar --build-url=${BUILD_URL} --name=micronaut-app