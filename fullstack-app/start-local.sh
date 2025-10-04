#!/bin/bash

echo "🚀 Starting Full Stack Application Locally..."
echo "================================"

# Kill any existing processes on ports 3000 and 3001
echo "Stopping any existing services..."
lsof -ti:3000 | xargs kill -9 2>/dev/null || echo "Port 3000 is free"
lsof -ti:3001 | xargs kill -9 2>/dev/null || echo "Port 3001 is free"

# Start backend
echo ""
echo "📡 Starting Backend Server..."
cd backend
npm install
node server.js &
BACKEND_PID=$!
echo "Backend started with PID: $BACKEND_PID"

# Wait for backend to start
sleep 3

# Start frontend
echo ""
echo "🌐 Starting Frontend Server..."
cd ../frontend
npm install
npm start &
FRONTEND_PID=$!
echo "Frontend started with PID: $FRONTEND_PID"

echo ""
echo "✅ Application started successfully!"
echo "📱 Frontend: http://localhost:3000"
echo "🔗 Backend: http://localhost:3001"
echo ""
echo "To stop the application, press Ctrl+C"
echo "Backend PID: $BACKEND_PID"
echo "Frontend PID: $FRONTEND_PID"

# Wait for user to stop
trap 'echo "Stopping services..."; kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit' INT
wait