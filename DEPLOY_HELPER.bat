@echo off
color 0A
echo.
echo ========================================
echo   YOUNG DEVS E-COMMERCE DEPLOYMENT
echo ========================================
echo.
echo I'll help you deploy your platform for FREE!
echo.
echo STEP 1: Do you have a GitHub account?
echo.
set /p github="Type 'yes' or 'no': "

if /i "%github%"=="no" (
    echo.
    echo 📝 CREATE GITHUB ACCOUNT:
    echo 1. Go to https://github.com
    echo 2. Click "Sign up"
    echo 3. Choose username like: youngdevs-ltd
    echo 4. Use your email and create password
    echo 5. Come back here when done!
    echo.
    pause
)

echo.
echo STEP 2: Upload your code to GitHub
echo.
echo 📤 UPLOAD OPTIONS:
echo.
echo OPTION A - Easy Upload (Recommended for beginners):
echo 1. Go to https://github.com
echo 2. Click "New repository" (green button)
echo 3. Name: youngdevs-ecommerce
echo 4. Make it Public
echo 5. Click "Create repository"
echo 6. Click "uploading an existing file"
echo 7. Drag ALL files from this folder: %cd%
echo 8. Write message: "Young Devs E-Commerce Platform"
echo 9. Click "Commit changes"
echo.
echo OPTION B - Command Line (if you know git):
echo 1. Create repo on GitHub first
echo 2. Copy the repo URL
echo 3. Run: git remote add origin YOUR_REPO_URL
echo 4. Run: git push -u origin master
echo.
set /p uploaded="Have you uploaded to GitHub? (yes/no): "

if /i "%uploaded%"=="no" (
    echo.
    echo ⏸️  Please upload to GitHub first, then run this script again!
    pause
    exit
)

echo.
echo STEP 3: Deploy Backend (Railway)
echo.
echo 🚂 RAILWAY DEPLOYMENT:
echo 1. Go to https://railway.app
echo 2. Click "Login" → "Login with GitHub"
echo 3. Click "New Project"
echo 4. Click "Deploy from GitHub repo"
echo 5. Select "youngdevs-ecommerce"
echo 6. Click "Deploy Now"
echo 7. Add PostgreSQL database (click "New" → "Database" → "PostgreSQL")
echo 8. Set environment variables in "Variables" tab:
echo    NODE_ENV = production
echo    JWT_SECRET = youngdevs_super_secret_key_2024
echo.
set /p backend="Is your backend deployed on Railway? (yes/no): "

echo.
echo STEP 4: Deploy Frontend (Netlify)
echo.
echo 🌐 NETLIFY DEPLOYMENT:
echo 1. Go to https://netlify.com
echo 2. Sign up with GitHub
echo 3. Click "New site from Git"
echo 4. Choose GitHub → Select "youngdevs-ecommerce"
echo 5. Base directory: frontend
echo 6. Build command: npm run build
echo 7. Publish directory: build
echo 8. Click "Deploy site"
echo.
set /p frontend="Is your frontend deployed on Netlify? (yes/no): "

echo.
echo STEP 5: Connect Frontend to Backend
echo.
echo 🔗 CONNECT SERVICES:
echo 1. Copy your Railway URL (from Railway dashboard)
echo 2. In Netlify: Site settings → Environment variables
echo 3. Add: REACT_APP_API_URL = https://your-railway-url.up.railway.app/api
echo 4. Go to Deploys → Trigger deploy
echo.
echo.
echo 🎉 CONGRATULATIONS! 
echo Your e-commerce platform should now be LIVE!
echo.
echo 📱 Test your site:
echo - Visit your Netlify URL
echo - Register a new account
echo - Browse products
echo - Test login/logout
echo.
echo 📞 Need help? Check BEGINNER_GUIDE.md for detailed instructions!
echo.
pause