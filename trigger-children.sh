#!/bin/bash

set -e
CHILD_PIPELINES=insa-dev-ayush-trigger-parallel
for CHILD_CONFIG in $CHILD_PIPELINES; do
  echo "Triggering child build for configuration: $CHILD_CONFIG"

  gcloud builds triggers run $CHILD_CONFIG \
  --branch=main \
  --project=internal-sandbox-446612
done
