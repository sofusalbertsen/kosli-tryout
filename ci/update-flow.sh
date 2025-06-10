#!/bin/bash
# This script creates a new flow in Kosli for a Micronaut application.
set -e

kosli create flow micronaut --description "My small application" --template-file=kosli/trail.yaml 