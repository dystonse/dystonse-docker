#!/bin/bash
set -e

./do.sh build dystonse-gtfs-data
./do.sh build
./do.sh up -d