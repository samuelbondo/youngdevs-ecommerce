@echo off
echo ========================================
echo Young Devs E-Commerce Platform Setup
echo ========================================
echo.

echo Installing root dependencies...
npm install
echo.

echo Installing backend dependencies...
cd backend
npm install
cd ..
echo.

echo Installing frontend dependencies...
cd frontend
npm install
cd ..
echo.

echo Setup complete!
echo.
echo To start development:
echo 1. Make sure PostgreSQL is running
echo 2. Create database: createdb youngdevs_ecommerce
echo 3. Run database setup: npm run setup:db
echo 4. (Optional) Seed sample data: npm run seed:db
echo 5. Start development servers: npm run dev
echo.
echo Or use Docker:
echo docker-compose up -d
echo.
pause