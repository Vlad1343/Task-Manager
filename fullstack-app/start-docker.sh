#!/bin/bash

echo "Start Application with Docker"

echo "Stop existing containers"
docker compose down 2>/dev/null

# Build and start containers

echo "Build and start containers"
docker compose up --build