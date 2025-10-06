#!/bin/bash

echo "Start Application locally"


# Kill any existing processes on ports 3000 and 3001
lsof -ti:3000 | xargs kill -9 2>/dev/null || echo "Port 3000 is free"
lsof -ti:3001 | xargs kill -9 2>/dev/null || echo "Port 3001 is free"


echo "Start Backend server"
cd backend
npm install
node server.js &
BACKEND_PID=$!
echo "Backend PID: $BACKEND_PID"

sleep 3

echo ""
echo "Start Frontend server"
cd ../frontend
npm install
npm start &
FRONTEND_PID=$!
echo "Frontend PID: $FRONTEND_PID"


echo "✅"
echo "Backend PID: $BACKEND_PID"
echo "Frontend PID: $FRONTEND_PID"

trap 'echo "Stopping services"; kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit' INT
wait