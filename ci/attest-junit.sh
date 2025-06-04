#!/bin/bash
# This script attests JUnit test results to Kosli for the current build.
set -e

kosli attest junit --name=unit-tests --results-dir=./app/build/test-results/ --trail=${GIT_COMMIT}