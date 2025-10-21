-- Add Cafe Adéia Menu Items (Fixed)
-- This migration adds all menu items for Cafe Adéia with proper UUID handling

-- First, let's ensure we have the categories
INSERT INTO categories (id, name, icon, sort_order) VALUES
('coffee-22oz', 'Coffee (22oz)', '☕', 1),
('non-coffee-22oz', 'Non-Coffee (22oz)', '🥤', 2),
('adeia-verde-22oz', 'Adéia Verde (22oz)', '🍃', 3),
('fruit-soda-22oz', 'Fruit Soda (22oz)', '🥤', 4),
('cheesecake-series-22oz', 'Cheesecake Series (22oz)', '🧀', 5),
('hot-coffee-12oz', 'Hot Coffee (12oz)', '☕', 6),
('quick-cravings', 'Quick Cravings by Adéia', '🍜', 7)
ON CONFLICT (id) DO NOTHING;

-- Coffee (22oz) items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Spanish Latte', 'Rich and creamy Spanish-style latte with a perfect balance of coffee and milk', 135.00, 'coffee-22oz', true, true, '/images/spanish-latte.jpg'),
('Spanish Seasalt', 'Spanish latte with a hint of sea salt for a unique flavor profile', 135.00, 'coffee-22oz', true, false, '/images/spanish-seasalt.jpg'),
('Caramel Macchiato', 'Layered espresso drink with vanilla syrup, steamed milk, and caramel drizzle', 135.00, 'coffee-22oz', true, true, '/images/caramel-macchiato.jpg'),
('Vanilla Latte', 'Smooth latte with rich vanilla flavor and steamed milk', 115.00, 'coffee-22oz', true, false, '/images/vanilla-latte.jpg'),
('Mocha', 'Classic chocolate and coffee combination with steamed milk', 135.00, 'coffee-22oz', true, true, '/images/mocha.jpg'),
('Dark Mocha', 'Intense dark chocolate mocha for the ultimate chocolate lover', 135.00, 'coffee-22oz', true, false, '/images/dark-mocha.jpg'),
('Chocolate Espresso', 'Bold espresso with rich chocolate flavor', 135.00, 'coffee-22oz', true, false, '/images/chocolate-espresso.jpg'),
('White Mocha', 'Creamy white chocolate mocha with espresso and steamed milk', 135.00, 'coffee-22oz', true, false, '/images/white-mocha.jpg'),
('Biscoff Latte', 'Smooth latte with Biscoff cookie spread for a sweet treat', 150.00, 'coffee-22oz', true, true, '/images/biscoff-latte.jpg'),
('Oreo Latte', 'Creamy latte with crushed Oreo cookies', 135.00, 'coffee-22oz', true, false, '/images/oreo-latte.jpg'),
('Purple Latte', 'Unique purple latte with ube flavor and beautiful presentation', 135.00, 'coffee-22oz', true, false, '/images/purple-latte.jpg'),
('Adéia Latte', 'Our signature house blend latte with a special touch', 115.00, 'coffee-22oz', true, true, '/images/adeia-latte.jpg'),
('Americano', 'Classic espresso with hot water for a clean, bold taste', 115.00, 'coffee-22oz', true, false, '/images/americano.jpg'),
('Lotus Biscoff Latte', 'Premium latte with Lotus Biscoff spread and cookie crumbs', 150.00, 'coffee-22oz', true, true, '/images/lotus-biscoff-latte.jpg');

-- Non-Coffee (22oz) items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Pink Milk', 'Sweet and creamy pink milk drink', 150.00, 'non-coffee-22oz', true, false, '/images/pink-milk.jpg'),
('Pandan Milk', 'Fragrant pandan-flavored milk drink', 150.00, 'non-coffee-22oz', true, false, '/images/pandan-milk.jpg'),
('Choco Berry', 'Rich chocolate with mixed berry flavors', 150.00, 'non-coffee-22oz', true, false, '/images/choco-berry.jpg'),
('Cookies and Cream', 'Creamy drink with crushed cookies', 110.00, 'non-coffee-22oz', true, true, '/images/cookies-cream.jpg'),
('Chocolate', 'Classic rich chocolate drink', 110.00, 'non-coffee-22oz', true, false, '/images/chocolate.jpg'),
('Dark Chocolate', 'Intense dark chocolate drink', 110.00, 'non-coffee-22oz', true, false, '/images/dark-chocolate.jpg'),
('Choco Vanilla', 'Chocolate and vanilla combination', 110.00, 'non-coffee-22oz', true, false, '/images/choco-vanilla.jpg'),
('Chocomalt', 'Malt-flavored chocolate drink', 110.00, 'non-coffee-22oz', true, false, '/images/chocomalt.jpg'),
('Purple Milk', 'Sweet purple milk with ube flavor', 130.00, 'non-coffee-22oz', true, false, '/images/purple-milk.jpg'),
('Strawberry Milk', 'Fresh strawberry-flavored milk', 130.00, 'non-coffee-22oz', true, true, '/images/strawberry-milk.jpg'),
('Blueberry Milk', 'Sweet blueberry milk drink', 130.00, 'non-coffee-22oz', true, false, '/images/blueberry-milk.jpg'),
('Mixberries Milk', 'Mixed berry milk with various fruit flavors', 130.00, 'non-coffee-22oz', true, false, '/images/mixberries-milk.jpg'),
('Vanilla Milk', 'Classic vanilla milk drink', 110.00, 'non-coffee-22oz', true, false, '/images/vanilla-milk.jpg'),
('Black Forest', 'Rich black forest flavor drink', 150.00, 'non-coffee-22oz', true, true, '/images/black-forest.jpg'),
('Biscoff Oreo Milk', 'Biscoff and Oreo combination milk drink', 150.00, 'non-coffee-22oz', true, false, '/images/biscoff-oreo-milk.jpg');

-- Adéia Verde (22oz) items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Matcha Seasalt', 'Premium matcha with a hint of sea salt', 150.00, 'adeia-verde-22oz', true, false, '/images/matcha-seasalt.jpg'),
('Matcha Oreo', 'Matcha latte with crushed Oreo cookies', 150.00, 'adeia-verde-22oz', true, true, '/images/matcha-oreo.jpg'),
('Matcha Latte', 'Smooth matcha latte with steamed milk', 140.00, 'adeia-verde-22oz', true, true, '/images/matcha-latte.jpg'),
('Matcha Espresso', 'Bold combination of matcha and espresso', 140.00, 'adeia-verde-22oz', true, false, '/images/matcha-espresso.jpg'),
('Matcha Milo', 'Matcha with Milo chocolate malt drink', 150.00, 'adeia-verde-22oz', true, false, '/images/matcha-milo.jpg'),
('Choco Matcha', 'Chocolate and matcha fusion drink', 150.00, 'adeia-verde-22oz', true, false, '/images/choco-matcha.jpg'),
('Strawberry Matcha', 'Fresh strawberry with matcha latte', 150.00, 'adeia-verde-22oz', true, true, '/images/strawberry-matcha.jpg');

-- Fruit Soda (22oz) items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Blueberry Soda', 'Refreshing blueberry-flavored soda', 85.00, 'fruit-soda-22oz', true, false, '/images/blueberry-soda.jpg'),
('Strawberry Soda', 'Sweet strawberry soda drink', 85.00, 'fruit-soda-22oz', true, true, '/images/strawberry-soda.jpg'),
('Green Apple Soda', 'Tart green apple soda', 85.00, 'fruit-soda-22oz', true, false, '/images/green-apple-soda.jpg'),
('Mixberries Soda', 'Mixed berry soda with various fruit flavors', 85.00, 'fruit-soda-22oz', true, false, '/images/mixberries-soda.jpg'),
('Lychee Soda', 'Exotic lychee-flavored soda', 85.00, 'fruit-soda-22oz', true, false, '/images/lychee-soda.jpg');

-- Cheesecake Series (22oz) items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Purple Cheesecake', 'Ube-flavored cheesecake drink', 150.00, 'cheesecake-series-22oz', true, false, '/images/purple-cheesecake.jpg'),
('Cheese Cheesecake', 'Classic cheesecake flavor drink', 150.00, 'cheesecake-series-22oz', true, true, '/images/cheese-cheesecake.jpg'),
('Blueberry Cheesecake', 'Blueberry cheesecake flavored drink', 150.00, 'cheesecake-series-22oz', true, false, '/images/blueberry-cheesecake.jpg'),
('Strawberry Cheesecake', 'Strawberry cheesecake flavored drink', 150.00, 'cheesecake-series-22oz', true, true, '/images/strawberry-cheesecake.jpg'),
('Biscoff Cheesecake', 'Biscoff cookie cheesecake drink', 170.00, 'cheesecake-series-22oz', true, true, '/images/biscoff-cheesecake.jpg'),
('Matcha Biscoff', 'Matcha and Biscoff cheesecake combination', 170.00, 'cheesecake-series-22oz', true, false, '/images/matcha-biscoff.jpg'),
('Strawberry Biscoff', 'Strawberry and Biscoff cheesecake drink', 170.00, 'cheesecake-series-22oz', true, false, '/images/strawberry-biscoff.jpg'),
('Blueberry Biscoff', 'Blueberry and Biscoff cheesecake drink', 170.00, 'cheesecake-series-22oz', true, false, '/images/blueberry-biscoff.jpg'),
('Biscoff Latte Cheesecake', 'Biscoff latte with cheesecake flavor', 170.00, 'cheesecake-series-22oz', true, true, '/images/biscoff-latte-cheesecake.jpg'),
('Matcha Cheesecake', 'Matcha cheesecake flavored drink', 150.00, 'cheesecake-series-22oz', true, false, '/images/matcha-cheesecake.jpg');

-- Hot Coffee (12oz) items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Spanish Latte (Hot)', 'Hot Spanish-style latte', 150.00, 'hot-coffee-12oz', true, true, '/images/spanish-latte-hot.jpg'),
('Caramel Macchiato (Hot)', 'Hot caramel macchiato', 150.00, 'hot-coffee-12oz', true, true, '/images/caramel-macchiato-hot.jpg'),
('Adéia Latte (Hot)', 'Hot signature house blend latte', 120.00, 'hot-coffee-12oz', true, true, '/images/adeia-latte-hot.jpg'),
('Biscoff Milk (Hot)', 'Hot Biscoff milk drink', 150.00, 'hot-coffee-12oz', true, false, '/images/biscoff-milk-hot.jpg'),
('Purple Milk (Hot)', 'Hot purple milk with ube flavor', 130.00, 'hot-coffee-12oz', true, false, '/images/purple-milk-hot.jpg'),
('Matcha Latte (Hot)', 'Hot matcha latte', 150.00, 'hot-coffee-12oz', true, true, '/images/matcha-latte-hot.jpg');

-- Quick Cravings items
INSERT INTO menu_items (name, description, base_price, category, available, popular, image_url) VALUES
('Creamy Buldak Overload', 'Spicy Korean buldak noodles with creamy sauce', 190.00, 'quick-cravings', true, true, '/images/creamy-buldak.jpg'),
('Cheesy Pancit Canton', 'Filipino pancit canton with cheese', 60.00, 'quick-cravings', true, false, '/images/cheesy-pancit.jpg'),
('Cheesy Fries Overload', 'Loaded fries with cheese and toppings', 130.00, 'quick-cravings', true, true, '/images/cheesy-fries.jpg'),
('Cheesy Nachos Overload', 'Loaded nachos with cheese and toppings', 130.00, 'quick-cravings', true, true, '/images/cheesy-nachos.jpg');

-- Add add-ons for drinks (using the menu item names to reference them)
-- Note: Since we're not using explicit IDs, we'll need to reference by name
-- This is a simplified version - in production you'd want to use proper foreign keys

-- Add add-ons for all drinks (Coffee, Non-Coffee, Adéia Verde, Fruit Soda, Cheesecake Series, Hot Coffee)
INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Espresso', 35.00, 'coffee'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Caramel Drizzle', 30.00, 'syrup'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Cheesecake', 40.00, 'topping'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Oreo', 20.00, 'topping'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Milk', 35.00, 'milk'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Biscoff Spread', 40.00, 'spread'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Biscoff Crumbs', 40.00, 'topping'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Biscoff Cookie', 40.00, 'topping'
FROM menu_items mi 
WHERE mi.category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz');

-- Add add-ons for Quick Cravings items
INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Cheese', 40.00, 'topping'
FROM menu_items mi 
WHERE mi.name = 'Creamy Buldak Overload';

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Mayo', 20.00, 'sauce'
FROM menu_items mi 
WHERE mi.name = 'Creamy Buldak Overload';

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Egg', 20.00, 'protein'
FROM menu_items mi 
WHERE mi.name = 'Creamy Buldak Overload';

-- Add similar add-ons for other Quick Cravings items
INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Cheese', 40.00, 'topping'
FROM menu_items mi 
WHERE mi.name IN ('Cheesy Pancit Canton', 'Cheesy Fries Overload', 'Cheesy Nachos Overload');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Mayo', 20.00, 'sauce'
FROM menu_items mi 
WHERE mi.name IN ('Cheesy Pancit Canton', 'Cheesy Fries Overload', 'Cheesy Nachos Overload');

INSERT INTO add_ons (menu_item_id, name, price, category) 
SELECT mi.id, 'Extra Egg', 20.00, 'protein'
FROM menu_items mi 
WHERE mi.name IN ('Cheesy Pancit Canton', 'Cheesy Fries Overload', 'Cheesy Nachos Overload');
