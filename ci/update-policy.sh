
#!/bin/bash
# This script updates the policy for a Kosli flow.
set -e
if [ -z "$KOSLI_ORG" ]; then
    KOSLI_ORG="sofusalbertsen"
fi
if [ -z "$KOSLI_FLOW" ]; then
    KOSLI_FLOW="micronaut"
fi
kosli create policy prod-requirements kosli/prod-policy.yaml

kosli attach-policy prod-requirements --environment=production
