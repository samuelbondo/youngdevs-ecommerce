-- Sample data for Young Devs Ltd E-Commerce Platform

-- Sample sellers
INSERT INTO users (name, email, phone, password_hash, role, email_verified, phone_verified) VALUES
('John Market Seller', 'john@market.com', '+256701000001', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'seller', true, true),
('Mary Fresh Foods', 'mary@freshfoods.com', '+256701000002', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'seller', true, true),
('Tech Store Uganda', 'tech@store.ug', '+256701000003', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'seller', true, true);

-- Sample customers
INSERT INTO users (name, email, phone, password_hash, role, email_verified, phone_verified) VALUES
('Alice Student', 'alice@student.com', '+256702000001', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'customer', true, true),
('Bob International', 'bob@international.com', '+256702000002', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'customer', true, true),
('Carol Local', 'carol@local.com', '+256702000003', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'customer', true, true);

-- Sample riders
INSERT INTO users (name, email, phone, password_hash, role, email_verified, phone_verified) VALUES
('David Rider', 'david@rider.com', '+256703000001', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'rider', true, true),
('Emma Delivery', 'emma@delivery.com', '+256703000002', '$2b$10$rQZ8kqVZ8qVZ8qVZ8qVZ8O', 'rider', true, true);

-- Create seller profiles
INSERT INTO sellers (user_id, store_name, store_description, is_approved, commission_rate)
SELECT user_id, 
       CASE 
         WHEN name = 'John Market Seller' THEN 'John''s Market Store'
         WHEN name = 'Mary Fresh Foods' THEN 'Mary''s Fresh Foods'
         WHEN name = 'Tech Store Uganda' THEN 'Tech Store Uganda'
       END,
       CASE 
         WHEN name = 'John Market Seller' THEN 'Quality products from local market'
         WHEN name = 'Mary Fresh Foods' THEN 'Fresh fruits and vegetables daily'
         WHEN name = 'Tech Store Uganda' THEN 'Latest electronics and gadgets'
       END,
       true, 10.00
FROM users WHERE role = 'seller';

-- Create rider profiles
INSERT INTO riders (user_id, vehicle_type, is_available)
SELECT user_id, 'motorcycle', true
FROM users WHERE role = 'rider';

-- Sample addresses
INSERT INTO user_addresses (user_id, address_line1, city, is_default)
SELECT user_id, 
       CASE 
         WHEN name LIKE '%Student%' THEN 'Makerere University Halls'
         WHEN name LIKE '%International%' THEN 'Kampala International Hotel'
         ELSE 'Kampala Central'
       END,
       'Kampala', true
FROM users WHERE role = 'customer';

-- Sample products
INSERT INTO products (seller_id, category_id, name, description, price, stock_quantity, sku)
SELECT s.seller_id, c.category_id, 
       CASE 
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Food & Beverages' THEN 'Fresh Bananas (1kg)'
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Clothing' THEN 'Cotton T-Shirt'
         WHEN s.store_name = 'Mary''s Fresh Foods' AND c.name = 'Food & Beverages' THEN 'Organic Tomatoes (1kg)'
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 'Smartphone Case'
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 'USB Cable'
       END,
       CASE 
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Food & Beverages' THEN 'Fresh local bananas, sweet and nutritious'
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Clothing' THEN '100% cotton comfortable t-shirt'
         WHEN s.store_name = 'Mary''s Fresh Foods' AND c.name = 'Food & Beverages' THEN 'Organic tomatoes grown locally'
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 'Protective case for smartphones'
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 'High-quality USB charging cable'
       END,
       CASE 
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Food & Beverages' THEN 5000.00
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Clothing' THEN 25000.00
         WHEN s.store_name = 'Mary''s Fresh Foods' AND c.name = 'Food & Beverages' THEN 8000.00
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 15000.00
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 12000.00
       END,
       50,
       CASE 
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Food & Beverages' THEN 'JMS-BAN-001'
         WHEN s.store_name = 'John''s Market Store' AND c.name = 'Clothing' THEN 'JMS-TSH-001'
         WHEN s.store_name = 'Mary''s Fresh Foods' AND c.name = 'Food & Beverages' THEN 'MFF-TOM-001'
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 'TSU-CASE-001'
         WHEN s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics' THEN 'TSU-USB-001'
       END
FROM sellers s
CROSS JOIN categories c
WHERE (s.store_name = 'John''s Market Store' AND c.name IN ('Food & Beverages', 'Clothing'))
   OR (s.store_name = 'Mary''s Fresh Foods' AND c.name = 'Food & Beverages')
   OR (s.store_name = 'Tech Store Uganda' AND c.name = 'Electronics');

-- Initialize customer loyalty records
INSERT INTO customer_loyalty (customer_id)
SELECT user_id FROM users WHERE role = 'customer';