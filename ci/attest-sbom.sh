#!/bin/bash
# This script attests a container SBOM to Kosli for the current build.
set -e

kosli attest generic --name container-sbom --trail ${GIT_COMMIT} --attachments  sbom.spdx.json