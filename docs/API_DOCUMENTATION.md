# Young Devs E-Commerce API Documentation

## Base URL
```
http://localhost:3000/api
```

## Authentication
All protected endpoints require a Bearer token in the Authorization header:
```
Authorization: Bearer <your_jwt_token>
```

## Response Format
All API responses follow this format:
```json
{
  "success": true,
  "message": "Success message",
  "data": { ... }
}
```

Error responses:
```json
{
  "success": false,
  "message": "Error message",
  "errors": [ ... ]
}
```

## Endpoints

### Authentication

#### POST /auth/register
Register a new user.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "+256701234567",
  "password": "password123",
  "role": "customer"
}
```

**Response:**
```json
{
  "message": "User registered successfully",
  "token": "jwt_token_here",
  "user": {
    "id": "uuid",
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "+256701234567",
    "role": "customer"
  }
}
```

#### POST /auth/login
Login user.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "message": "Login successful",
  "token": "jwt_token_here",
  "user": {
    "id": "uuid",
    "name": "John Doe",
    "email": "john@example.com",
    "role": "customer"
  }
}
```

#### GET /auth/me
Get current user information. (Protected)

**Response:**
```json
{
  "user": {
    "id": "uuid",
    "name": "John Doe",
    "email": "john@example.com",
    "role": "customer"
  }
}
```

### Products

#### GET /products
Get all products with optional filters.

**Query Parameters:**
- `category` (string): Filter by category name
- `search` (string): Search in product name and description
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 20)
- `seller_id` (string): Filter by seller ID

**Response:**
```json
{
  "products": [
    {
      "product_id": "uuid",
      "name": "Product Name",
      "description": "Product description",
      "price": 25000.00,
      "stock_quantity": 50,
      "category_name": "Electronics",
      "store_name": "Tech Store",
      "primary_image": "image_url"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "pages": 5
  }
}
```

#### GET /products/:id
Get single product details.

**Response:**
```json
{
  "product": {
    "product_id": "uuid",
    "name": "Product Name",
    "description": "Detailed description",
    "price": 25000.00,
    "stock_quantity": 50,
    "category_name": "Electronics",
    "store_name": "Tech Store",
    "seller_name": "John Seller",
    "seller_phone": "+256701234567",
    "images": [
      {
        "image_url": "url1",
        "is_primary": true
      }
    ],
    "reviews": [
      {
        "rating": 5,
        "comment": "Great product!",
        "customer_name": "Jane Doe"
      }
    ]
  }
}
```

#### POST /products
Create new product. (Sellers only)

**Request Body:**
```json
{
  "name": "New Product",
  "description": "Product description",
  "price": 15000.00,
  "stock_quantity": 100,
  "category_id": "uuid",
  "sku": "PROD-001"
}
```

#### GET /products/categories/all
Get all product categories.

**Response:**
```json
{
  "categories": [
    {
      "category_id": "uuid",
      "name": "Electronics",
      "description": "Electronic devices"
    }
  ]
}
```

### Shopping Cart

#### GET /users/cart
Get user's shopping cart. (Protected)

**Response:**
```json
{
  "cart_items": [
    {
      "product_id": "uuid",
      "name": "Product Name",
      "price": 25000.00,
      "quantity": 2,
      "store_name": "Tech Store",
      "product_image": "image_url"
    }
  ],
  "total": 50000.00,
  "item_count": 1
}
```

#### POST /users/cart
Add item to cart. (Protected)

**Request Body:**
```json
{
  "product_id": "uuid",
  "quantity": 2
}
```

#### DELETE /users/cart/:product_id
Remove item from cart. (Protected)

### Orders

#### POST /orders
Create new order. (Customers only)

**Request Body:**
```json
{
  "items": [
    {
      "product_id": "uuid",
      "quantity": 2
    }
  ],
  "delivery_address_id": "uuid",
  "notes": "Please deliver in the evening"
}
```

**Response:**
```json
{
  "message": "Order created successfully",
  "order": {
    "order_id": "uuid",
    "order_number": "YD1234567890123",
    "total_amount": 55000.00,
    "status": "pending",
    "items": [...]
  }
}
```

#### GET /orders/my-orders
Get user's orders. (Protected)

**Query Parameters:**
- `page` (number): Page number
- `limit` (number): Items per page

**Response:**
```json
{
  "orders": [
    {
      "order_id": "uuid",
      "order_number": "YD1234567890123",
      "total_amount": 55000.00,
      "status": "delivered",
      "created_at": "2023-01-01T00:00:00Z",
      "items": [...]
    }
  ]
}
```

#### GET /orders/:id
Get single order details. (Protected)

**Response:**
```json
{
  "order": {
    "order_id": "uuid",
    "order_number": "YD1234567890123",
    "total_amount": 55000.00,
    "status": "delivered",
    "payment_status": "paid",
    "delivery_address": "123 Main St, Kampala",
    "items": [...],
    "delivery": {
      "status": "delivered",
      "rider_name": "Delivery Guy",
      "delivery_time": "2023-01-01T12:00:00Z"
    }
  }
}
```

### Payments

#### POST /payments/process
Process payment for order. (Protected)

**Request Body:**
```json
{
  "order_id": "uuid",
  "payment_method": "mobile_money",
  "phone_number": "+256701234567"
}
```

**Response:**
```json
{
  "message": "Payment processed successfully",
  "payment": {
    "payment_id": "uuid",
    "transaction_reference": "YD_PAY_1234567890",
    "status": "completed",
    "amount": 55000.00,
    "payment_method": "mobile_money"
  }
}
```

#### GET /payments/receipt/:order_id
Get order receipt. (Protected)

**Response:**
```json
{
  "receipt": {
    "order_number": "YD1234567890123",
    "order_date": "2023-01-01T00:00:00Z",
    "customer": {
      "name": "John Doe",
      "email": "john@example.com"
    },
    "items": [...],
    "totals": {
      "subtotal": 50000.00,
      "service_fee": 2500.00,
      "delivery_fee": 2500.00,
      "total": 55000.00
    },
    "payment": {
      "method": "mobile_money",
      "reference": "YD_PAY_1234567890"
    }
  }
}
```

### Delivery Tracking

#### GET /deliveries/track/:order_number
Track delivery by order number. (Public)

**Response:**
```json
{
  "tracking": {
    "status": "in_transit",
    "pickup_time": "2023-01-01T10:00:00Z",
    "estimated_delivery": "2023-01-01T16:00:00Z",
    "rider_name": "Delivery Guy",
    "rider_phone": "+256701234567"
  }
}
```

### Admin Endpoints

#### GET /admin/dashboard
Get admin dashboard data. (Admin only)

**Response:**
```json
{
  "metrics": {
    "total_customers": 1000,
    "total_orders": 500,
    "total_revenue": 50000000.00,
    "pending_orders": 25
  },
  "recent_orders": [...],
  "top_products": [...],
  "monthly_revenue": [...]
}
```

#### GET /admin/users
Get all users. (Admin only)

**Query Parameters:**
- `role` (string): Filter by user role
- `search` (string): Search by name or email
- `page` (number): Page number
- `limit` (number): Items per page

#### GET /admin/sellers
Get all sellers. (Admin only)

**Query Parameters:**
- `status` (string): 'approved' or 'pending'
- `page` (number): Page number
- `limit` (number): Items per page

#### PATCH /admin/sellers/:seller_id/approval
Approve or reject seller. (Admin only)

**Request Body:**
```json
{
  "is_approved": true
}
```

## Error Codes

- `400` - Bad Request (validation errors)
- `401` - Unauthorized (invalid or missing token)
- `403` - Forbidden (insufficient permissions)
- `404` - Not Found
- `409` - Conflict (duplicate data)
- `500` - Internal Server Error

## Rate Limiting

API requests are limited to 100 requests per 15-minute window per IP address.

## Pagination

List endpoints support pagination with these parameters:
- `page`: Page number (starts from 1)
- `limit`: Items per page (max 100)

Response includes pagination metadata:
```json
{
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "pages": 5
  }
}
```