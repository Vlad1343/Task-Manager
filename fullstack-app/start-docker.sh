#!/bin/bash

echo "🐳 Starting Full Stack Application with Docker..."
echo "============================================"

# Stop any existing containers
echo "Stopping existing containers..."
docker compose down 2>/dev/null

# Build and start containers
echo ""
echo "Building and starting containers..."
docker compose up --build

echo ""
echo "✅ Application should be available at:"
echo "📱 Frontend: http://localhost:3000"
echo "🔗 Backend: http://localhost:5000"