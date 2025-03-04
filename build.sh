#!/bin/bash
set -eou pipefail

OUTPUT_DIR=./static

# Run the build process using logseq's dockerfile
# The build seems to use a lot of RAM, hence the build args
# Otherwise I ran into [OutOfMemoryError: Java heap space]
docker build -t logseq-builder -f logseq/Dockerfile . \
  --build-arg JAVA_OPTS="-Xmx32g" \
  --build-arg NODE_OPTIONS="--max-old-space-size=8192"

# Create a container that exits immediately
docker create --name logseq-build-container logseq-builder

# Copy the built static assets into the local file system
docker cp logseq-build-container:/usr/share/nginx/html $OUTPUT_DIR

# Cleanup
docker rm logseq-build-container

cp run.sh $OUTPUT_DIR/

echo "Logseq build complete"