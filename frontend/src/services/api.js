import axios from 'axios';

const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:3000/api';

// Create axios instance
const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add auth token to requests
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// Handle auth errors
api.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

// Auth API
export const authAPI = {
  login: (email, password) => api.post('/auth/login', { email, password }),
  register: (userData) => api.post('/auth/register', userData),
  getCurrentUser: () => api.get('/auth/me'),
};

// Products API
export const productsAPI = {
  getProducts: (params) => api.get('/products', { params }),
  getProduct: (id) => api.get(`/products/${id}`),
  getCategories: () => api.get('/products/categories/all'),
  createProduct: (productData) => api.post('/products', productData),
};

// User API
export const userAPI = {
  getProfile: () => api.get('/users/profile'),
  addAddress: (addressData) => api.post('/users/addresses', addressData),
  getCart: () => api.get('/users/cart'),
  addToCart: (productId, quantity) => api.post('/users/cart', { product_id: productId, quantity }),
  removeFromCart: (productId) => api.delete(`/users/cart/${productId}`),
};

// Orders API
export const ordersAPI = {
  createOrder: (orderData) => api.post('/orders', orderData),
  getMyOrders: (params) => api.get('/orders/my-orders', { params }),
  getOrder: (id) => api.get(`/orders/${id}`),
  updateOrderStatus: (id, status) => api.patch(`/orders/${id}/status`, { status }),
};

// Payments API
export const paymentsAPI = {
  processPayment: (paymentData) => api.post('/payments/process', paymentData),
  getPaymentStatus: (paymentId) => api.get(`/payments/${paymentId}/status`),
  getTransactionHistory: (params) => api.get('/payments/transactions/history', { params }),
  getReceipt: (orderId) => api.get(`/payments/receipt/${orderId}`),
};

// Delivery API
export const deliveryAPI = {
  getMyDeliveries: (params) => api.get('/deliveries/my-deliveries', { params }),
  updateDeliveryStatus: (deliveryId, statusData) => api.patch(`/deliveries/${deliveryId}/status`, statusData),
  trackDelivery: (orderNumber) => api.get(`/deliveries/track/${orderNumber}`),
  assignDelivery: (assignmentData) => api.post('/deliveries/assign', assignmentData),
};

// Admin API
export const adminAPI = {
  getDashboard: () => api.get('/admin/dashboard'),
  getUsers: (params) => api.get('/admin/users', { params }),
  getSellers: (params) => api.get('/admin/sellers', { params }),
  updateSellerApproval: (sellerId, isApproved) => api.patch(`/admin/sellers/${sellerId}/approval`, { is_approved: isApproved }),
  getOrders: (params) => api.get('/admin/orders', { params }),
  getIncidents: (params) => api.get('/admin/incidents', { params }),
  resolveIncident: (incidentId, resolutionNotes) => api.patch(`/admin/incidents/${incidentId}/resolve`, { resolution_notes: resolutionNotes }),
  getSalesReport: (params) => api.get('/admin/reports/sales', { params }),
};

export default api;