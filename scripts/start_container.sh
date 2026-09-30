#!/bin/bash
set -euo pipefail

IMAGE="sufiyankhan10/karachi-status-api:latest"
NAME="karachi-status-api"

echo "Pulling $IMAGE"
docker pull "$IMAGE"

echo "Starting $NAME on port 80"
docker run -d --name "$NAME" --restart unless-stopped -p 80:5000 "$IMAGE"

# quick sanity check before CodeDeploy marks this step successful
for i in {1..10}; do
  if curl -fs http://localhost/health > /dev/null; then
    echo "App is healthy"
    exit 0
  fi
  sleep 2
done

echo "Health check failed" >&2
exit 1
