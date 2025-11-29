import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';
  static late Dio _dio;
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> initialize() async {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Add auth interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          await clearToken();
          // Navigate to login screen
        }
        handler.next(error);
      },
    ));
  }

  // Token management
  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  static Future<void> setToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: 'auth_token');
  }

  // Auth endpoints
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  static Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    final response = await _dio.post('/auth/register', data: userData);
    return response.data;
  }

  static Future<Map<String, dynamic>> getCurrentUser() async {
    final response = await _dio.get('/auth/me');
    return response.data;
  }

  // Products endpoints
  static Future<Map<String, dynamic>> getProducts({
    String? category,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dio.get('/products', queryParameters: {
      if (category != null) 'category': category,
      if (search != null) 'search': search,
      'page': page,
      'limit': limit,
    });
    return response.data;
  }

  static Future<Map<String, dynamic>> getProduct(String id) async {
    final response = await _dio.get('/products/$id');
    return response.data;
  }

  static Future<Map<String, dynamic>> getCategories() async {
    final response = await _dio.get('/products/categories/all');
    return response.data;
  }

  // Cart endpoints
  static Future<Map<String, dynamic>> getCart() async {
    final response = await _dio.get('/users/cart');
    return response.data;
  }

  static Future<Map<String, dynamic>> addToCart(String productId, int quantity) async {
    final response = await _dio.post('/users/cart', data: {
      'product_id': productId,
      'quantity': quantity,
    });
    return response.data;
  }

  static Future<void> removeFromCart(String productId) async {
    await _dio.delete('/users/cart/$productId');
  }

  // Orders endpoints
  static Future<Map<String, dynamic>> createOrder(Map<String, dynamic> orderData) async {
    final response = await _dio.post('/orders', data: orderData);
    return response.data;
  }

  static Future<Map<String, dynamic>> getMyOrders({int page = 1, int limit = 20}) async {
    final response = await _dio.get('/orders/my-orders', queryParameters: {
      'page': page,
      'limit': limit,
    });
    return response.data;
  }

  static Future<Map<String, dynamic>> getOrder(String id) async {
    final response = await _dio.get('/orders/$id');
    return response.data;
  }

  // Payment endpoints
  static Future<Map<String, dynamic>> processPayment(Map<String, dynamic> paymentData) async {
    final response = await _dio.post('/payments/process', data: paymentData);
    return response.data;
  }

  static Future<Map<String, dynamic>> getPaymentStatus(String paymentId) async {
    final response = await _dio.get('/payments/$paymentId/status');
    return response.data;
  }

  static Future<Map<String, dynamic>> getReceipt(String orderId) async {
    final response = await _dio.get('/payments/receipt/$orderId');
    return response.data;
  }

  // User endpoints
  static Future<Map<String, dynamic>> getProfile() async {
    final response = await _dio.get('/users/profile');
    return response.data;
  }

  static Future<Map<String, dynamic>> addAddress(Map<String, dynamic> addressData) async {
    final response = await _dio.post('/users/addresses', data: addressData);
    return response.data;
  }

  // Delivery tracking
  static Future<Map<String, dynamic>> trackDelivery(String orderNumber) async {
    final response = await _dio.get('/deliveries/track/$orderNumber');
    return response.data;
  }
}