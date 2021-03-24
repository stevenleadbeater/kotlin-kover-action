#!/bin/bash
set -e

mender-artifact write module-image \
  -T deb \
  -n "$INPUT_ARTIFACT_NAME" \
  -t "$INPUT_DEVICE_TYPE" \
  -o "$INPUT_ARTIFACT_NAME".mender \
  -f "${INPUT_PACKAGES// / -f }"

mender-cli login \
  --server "$INPUT_SERVER_ADDRESS" \
  --username "$INPUT_USERNAME" \
  --password "$INPUT_PASSWORD"

mender-cli artifacts \
  --server https://mender.albeeconnect.co.uk \
  upload \
  "$INPUT_ARTIFACT_NAME".mender