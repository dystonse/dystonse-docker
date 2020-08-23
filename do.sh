#!/bin/bash
set -e

FILES="-f docker-compose.yml -f docker-compose.override.yml -f docker-compose.server.yml"
docker-compose $FILES "$@"