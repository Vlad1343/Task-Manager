@echo off
echo 🚀 Starting Full Stack Application Locally...
echo ================================

echo Stopping any existing services...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3000" ^| find "LISTENING"') do taskkill /f /pid %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| find ":5000" ^| find "LISTENING"') do taskkill /f /pid %%a >nul 2>&1

echo.
echo 📡 Starting Backend Server...
cd backend
call npm install
start /b node server.js

timeout /t 3 >nul

echo.
echo 🌐 Starting Frontend Server...
cd ..\frontend
call npm install
call npm start

echo.
echo ✅ Application started successfully!
echo 📱 Frontend: http://localhost:3000
echo 🔗 Backend: http://localhost:5000
pause