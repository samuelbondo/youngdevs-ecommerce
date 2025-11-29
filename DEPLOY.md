# 🚀 Quick Deploy Guide

## Option 1: Railway + Netlify (Recommended)

### Backend (Railway)
1. Go to [railway.app](https://railway.app)
2. Click "Start a New Project"
3. Connect GitHub and select this repo
4. Choose "Deploy from repo" → Select `/backend` folder
5. Add PostgreSQL database service
6. Set environment variables:
   ```
   NODE_ENV=production
   JWT_SECRET=your-super-secret-key
   FRONTEND_URL=https://your-netlify-app.netlify.app
   ```
7. Deploy! 🚀

### Frontend (Netlify)
1. Build the app: `cd frontend && npm run build`
2. Go to [netlify.com](https://netlify.com)
3. Drag and drop the `build` folder
4. Or connect GitHub for auto-deploy
5. Set environment variable:
   ```
   REACT_APP_API_URL=https://your-railway-app.up.railway.app/api
   ```

## Option 2: Render + Vercel

### Backend (Render)
1. Go to [render.com](https://render.com)
2. "New Web Service" → Connect GitHub
3. Select this repo, root directory: `backend`
4. Build: `npm install`
5. Start: `npm start`

### Frontend (Vercel)
1. Go to [vercel.com](https://vercel.com)
2. Import project from GitHub
3. Root directory: `frontend`
4. Auto-deploys on push

## Option 3: Supabase (Database)

1. Go to [supabase.com](https://supabase.com)
2. Create new project
3. Copy connection string
4. Run SQL from `database/schema.sql`
5. Update backend environment variables

## 🎯 Expected Results

After deployment you'll have:
- ✅ **Backend API**: `https://your-app.railway.app`
- ✅ **Frontend**: `https://your-app.netlify.app`  
- ✅ **Database**: PostgreSQL on Railway/Supabase
- ✅ **SSL**: Automatic HTTPS
- ✅ **Auto-deploy**: On git push

## 🔧 Test Your Deployment

```bash
# Test API health
curl https://your-backend-url.com/health

# Test products endpoint
curl https://your-backend-url.com/api/products

# Visit frontend
https://your-frontend-url.com
```

## 💰 Free Tier Limits

- **Railway**: 500 hours/month, 1GB RAM
- **Netlify**: 100GB bandwidth, 300 build minutes
- **Render**: 750 hours/month
- **Vercel**: 100GB bandwidth
- **Supabase**: 500MB database, 2GB bandwidth

## 🚀 Go Live in 10 Minutes!

1. Push code to GitHub
2. Connect Railway (backend)
3. Connect Netlify (frontend)
4. Set environment variables
5. **LIVE!** 🎉