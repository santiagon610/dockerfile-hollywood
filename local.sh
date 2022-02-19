#!/usr/bin/env bash

set -e

IMAGE_NAME="hollywood-local"

if [ "${1}" == "debug" ]; then
  DEBUG_STRING="--entrypoint /bin/sh"
elif [ "${1}" == "build" ]; then
  podman build --no-cache -t ${IMAGE_NAME} .
fi

podman run -it --rm ${DEBUG_STRING} ${IMAGE_NAME}
