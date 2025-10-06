#!/bin/bash
cd /Users/vladyslavshutkevych/Downloads/docker/fullstack-app/backend
echo "Backend server on port 3001"
echo "Current directory: $(pwd)"
echo "Server.js exists: $(ls -la server.js)"
echo "Starting server"
node server.js