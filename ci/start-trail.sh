#!/bin/bash
# This script starts a new trail in Kosli with a specified flow and description.
# Usage: ./start-trail.sh
set -e

kosli begin trail ${GIT_COMMIT} --description "build number ${BUILD_NUMBER}"
