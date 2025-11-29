# Young Devs Ltd E-Commerce Platform

A comprehensive e-commerce platform designed to provide fair, transparent, and secure shopping experience for locals, international students, and foreigners in Uganda.

## 🚀 Features

### Customer Features
- **Fair Pricing**: Fixed prices for all users regardless of background
- **Secure Shopping**: Browse products, add to cart, secure checkout
- **Multiple Payment Options**: Mobile Money (MTN, Airtel), Card payments, Bank transfer
- **Order Tracking**: Real-time delivery tracking with notifications
- **Digital Receipts**: Downloadable receipts with QR codes
- **Transaction History**: Complete purchase history and loyalty tracking

### Seller Features
- **Product Management**: Add, edit, and manage product listings
- **Order Management**: View and fulfill customer orders
- **Analytics Dashboard**: Sales reports and performance metrics
- **Payment Processing**: Automated payment distribution after platform fees

### Delivery Features
- **Rider Dashboard**: View assigned deliveries and update status
- **Proof of Delivery**: Photo and signature capture
- **Route Optimization**: Efficient delivery management

### Admin Features
- **Platform Management**: User, seller, and rider management
- **Order Oversight**: Monitor all transactions and resolve disputes
- **Analytics**: Comprehensive business intelligence and reporting
- **Incident Management**: Handle complaints and refunds

## 🏗️ Architecture

### Backend (Node.js + Express)
- **API**: RESTful API with JWT authentication
- **Database**: PostgreSQL with comprehensive audit logging
- **Security**: Encrypted passwords, secure payment processing
- **Scalability**: Modular architecture for easy expansion

### Frontend (React.js)
- **Responsive Design**: Works on desktop, tablet, and mobile
- **Modern UI**: Clean, intuitive interface with Tailwind CSS
- **State Management**: Context API for global state
- **Real-time Updates**: Live order and delivery tracking

### Mobile App (Flutter)
- **Cross-platform**: iOS and Android from single codebase
- **Native Performance**: Smooth, responsive user experience
- **Offline Support**: Basic functionality without internet
- **Push Notifications**: Order updates and promotions

## 📦 Installation & Setup

### Prerequisites
- Node.js (v16 or higher)
- PostgreSQL (v12 or higher)
- Flutter SDK (v3.10 or higher)
- Git

### Backend Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd youngdevs-ecommerce/backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Setup environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Setup database**
   ```bash
   # Create PostgreSQL database
   createdb youngdevs_ecommerce
   
   # Run migrations
   psql -d youngdevs_ecommerce -f ../database/schema.sql
   
   # Seed sample data (optional)
   psql -d youngdevs_ecommerce -f ../database/seed_data.sql
   ```

5. **Start the server**
   ```bash
   npm run dev
   ```

### Frontend Setup

1. **Navigate to frontend directory**
   ```bash
   cd ../frontend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm start
   ```

### Mobile App Setup

1. **Navigate to mobile directory**
   ```bash
   cd ../mobile
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Configuration

### Environment Variables

#### Backend (.env)
```env
# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=youngdevs_ecommerce
DB_USER=postgres
DB_PASSWORD=your_password

# JWT
JWT_SECRET=your_super_secret_jwt_key
JWT_EXPIRES_IN=7d

# Server
PORT=3000
NODE_ENV=development

# Payment Gateways
FLUTTERWAVE_PUBLIC_KEY=your_key
FLUTTERWAVE_SECRET_KEY=your_secret
MTN_API_KEY=your_mtn_key
AIRTEL_API_KEY=your_airtel_key

# Email (Optional)
EMAIL_HOST=smtp.gmail.com
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_app_password

# File Upload (Optional)
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
```

## 🚀 Deployment

### Backend Deployment (Production)

1. **Build for production**
   ```bash
   npm run build
   ```

2. **Deploy to cloud provider**
   - AWS EC2/ECS
   - Google Cloud Platform
   - DigitalOcean Droplets
   - Heroku

3. **Setup production database**
   - Use managed PostgreSQL service
   - Configure SSL connections
   - Setup automated backups

### Frontend Deployment

1. **Build for production**
   ```bash
   npm run build
   ```

2. **Deploy static files**
   - Netlify
   - Vercel
   - AWS S3 + CloudFront
   - GitHub Pages

### Mobile App Deployment

1. **Build for Android**
   ```bash
   flutter build apk --release
   ```

2. **Build for iOS**
   ```bash
   flutter build ios --release
   ```

3. **Deploy to app stores**
   - Google Play Store
   - Apple App Store

## 📊 Database Schema

### Key Tables
- **users**: Customer, seller, admin, and rider accounts
- **products**: Product catalog with categories
- **orders**: Order management and tracking
- **payments**: Payment processing and history
- **deliveries**: Delivery assignment and tracking
- **transactions**: Complete audit trail
- **incidents**: Issue tracking and resolution

See `database/schema.sql` for complete database structure.

## 🔐 Security Features

- **Authentication**: JWT-based secure authentication
- **Authorization**: Role-based access control
- **Data Protection**: Encrypted passwords and sensitive data
- **Audit Logging**: Complete transaction history
- **Payment Security**: Secure payment gateway integration
- **API Security**: Rate limiting and input validation

## 📱 API Documentation

### Authentication Endpoints
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `GET /api/auth/me` - Get current user

### Product Endpoints
- `GET /api/products` - List products with filters
- `GET /api/products/:id` - Get product details
- `POST /api/products` - Create product (sellers only)

### Order Endpoints
- `POST /api/orders` - Create new order
- `GET /api/orders/my-orders` - Get user orders
- `GET /api/orders/:id` - Get order details

### Payment Endpoints
- `POST /api/payments/process` - Process payment
- `GET /api/payments/receipt/:orderId` - Get receipt

See API documentation for complete endpoint list.

## 🧪 Testing

### Backend Testing
```bash
cd backend
npm test
```

### Frontend Testing
```bash
cd frontend
npm test
```

### Mobile Testing
```bash
cd mobile
flutter test
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and inquiries:
- Email: support@youngdevs.com
- Phone: +256 700 000 000
- Website: https://youngdevs.com

## 🗺️ Roadmap

### Phase 1 (Current)
- ✅ Core e-commerce functionality
- ✅ User authentication and authorization
- ✅ Product catalog and search
- ✅ Shopping cart and checkout
- ✅ Payment processing
- ✅ Order management
- ✅ Delivery tracking

### Phase 2 (Next)
- 🔄 Advanced analytics dashboard
- 🔄 Mobile app enhancements
- 🔄 Multi-language support
- 🔄 Advanced search and filters
- 🔄 Seller verification system

### Phase 3 (Future)
- 📋 Social media integration
- 📋 Loyalty program enhancements
- 📋 AI-powered recommendations
- 📋 Advanced reporting tools
- 📋 Multi-currency support

---

**Built with ❤️ by Young Devs Ltd**