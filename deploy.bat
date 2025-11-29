@echo off
echo ========================================
echo Young Devs E-Commerce Deployment
echo ========================================
echo.

echo Choose deployment option:
echo 1. Railway (Backend + DB) + Netlify (Frontend)
echo 2. Render (Backend) + Vercel (Frontend)  
echo 3. All platforms (for testing)
echo.

set /p choice="Enter choice (1-3): "

if "%choice%"=="1" goto railway_netlify
if "%choice%"=="2" goto render_vercel
if "%choice%"=="3" goto all_platforms

:railway_netlify
echo Deploying to Railway + Netlify...
echo.
echo 1. Go to railway.app and connect GitHub
echo 2. Deploy backend from /backend folder
echo 3. Add PostgreSQL database
echo 4. Go to netlify.com and drag /frontend/build folder
echo 5. Set environment variables
goto end

:render_vercel
echo Deploying to Render + Vercel...
echo.
echo 1. Go to render.com and connect GitHub
echo 2. Deploy backend as Web Service
echo 3. Go to vercel.com and import project
echo 4. Deploy frontend
goto end

:all_platforms
echo Testing all platforms...
echo Follow instructions for each platform
goto end

:end
echo.
echo Deployment instructions displayed!
echo Check the URLs after deployment.
pause