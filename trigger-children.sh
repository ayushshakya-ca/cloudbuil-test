#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Find all child pipeline YAML files.
CHILD_PIPELINES=$(find child-pipelines -name "child-*.yaml")

# Loop through each child pipeline file and trigger a build.
for CHILD_CONFIG in $CHILD_PIPELINES; do
  echo "Triggering child build for configuration: $CHILD_CONFIG"

  gcloud builds submit \
    --config="${CHILD_CONFIG}" \
    --no-source \
    --async
done
