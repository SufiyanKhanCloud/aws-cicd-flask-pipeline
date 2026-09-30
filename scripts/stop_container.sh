#!/bin/bash
set -uo pipefail

NAME="karachi-status-api"

# On the very first deployment there is nothing to stop, so don't fail
if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
  echo "Removing old container $NAME"
  docker rm -f "$NAME"
else
  echo "No existing container, skipping"
fi
