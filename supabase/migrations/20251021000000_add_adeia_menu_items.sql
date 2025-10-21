/*
  # Add Adéia Café Menu Items
  
  1. New Categories
    - Coffee (22oz) - Hot and cold coffee beverages
    - Non-Coffee (22oz) - Milk-based and chocolate drinks
    - Adéia Verde (22oz) - Matcha-based beverages
    - Fruit Soda (22oz) - Refreshing fruit sodas
    - Cheesecake Series (22oz) - Premium cheesecake drinks
    - Hot Coffee (12oz) - Hot coffee beverages
    - Quick Cravings - Food items
    - Drink Add-ons - Add-ons specifically for beverages
    - Food Add-ons - Add-ons for food items
  
  2. Menu Items
    - Complete menu with proper categorization
    - Includes all beverages and food items
    - Add-ons linked to appropriate categories
    - Items with multiple prices have variations
  
  3. Features
    - Professional descriptions for each item
    - Proper pricing structure
    - Category-based organization
    - Add-ons system for customization
*/

-- ============================================================================
-- STEP 1: Create Categories
-- ============================================================================

INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('coffee-22oz', 'Coffee (22oz)', '☕', 1, true),
  ('non-coffee-22oz', 'Non-Coffee (22oz)', '🥤', 2, true),
  ('adeia-verde-22oz', 'Adéia Verde (22oz)', '🍵', 3, true),
  ('fruit-soda-22oz', 'Fruit Soda (22oz)', '🧃', 4, true),
  ('cheesecake-series-22oz', 'Cheesecake Series (22oz)', '🍰', 5, true),
  ('hot-coffee-12oz', 'Hot Coffee (12oz)', '☕', 6, true),
  ('quick-cravings', 'Quick Cravings', '🍜', 7, true),
  ('drink-addons', 'Drink Add-ons', '➕', 8, true),
  ('food-addons', 'Food Add-ons', '➕', 9, true)
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- STEP 2: Insert Coffee (22oz) Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Spanish Latte', 'Rich espresso with creamy sweetened condensed milk - a Spanish coffee classic', 135, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Spanish Seasalt', 'Spanish latte topped with a perfect balance of sea salt cream', 135, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Caramel Macchiato', 'Espresso with vanilla syrup, steamed milk, and rich caramel drizzle', 135, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Vanilla Latte', 'Smooth espresso blended with sweet vanilla and steamed milk', 115, 'coffee-22oz', false, true, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mocha', 'Classic combination of espresso, chocolate, and steamed milk', 135, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Dark Mocha', 'Bold dark chocolate blended with rich espresso', 135, 'coffee-22oz', false, true, 'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Chocolate Espresso', 'Intense espresso with velvety chocolate - for chocolate lovers', 135, 'coffee-22oz', false, true, 'https://images.pexels.com/photos/1526385/pexels-photo-1526385.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('White Mocha', 'Smooth white chocolate and espresso with steamed milk', 135, 'coffee-22oz', false, true, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Latte', 'Espresso with signature Lotus Biscoff cookie butter spread', 150, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Oreo Latte', 'Creamy latte blended with crushed Oreo cookies', 135, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Purple Latte', 'Unique purple yam (ube) flavored latte with espresso', 135, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Adéia Latte', 'Our signature house blend latte - smooth and perfectly balanced', 115, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Americano', 'Classic espresso with hot water - bold and simple', 115, 'coffee-22oz', false, true, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Lotus Biscoff Latte', 'Espresso with premium Lotus Biscoff spread and caramelized cookie crumbs', 150, 'coffee-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 3: Insert Non-Coffee (22oz) Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Pink Milk', 'Sweet and creamy strawberry-flavored milk drink', 150, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1591119/pexels-photo-1591119.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Pandan Milk', 'Fragrant pandan leaf infused with creamy milk', 150, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Choco Berry', 'Rich chocolate blended with fresh berries', 150, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cookies and Cream', 'Classic cookies and cream milkshake', 110, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Chocolate', 'Rich and creamy chocolate milk', 110, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Dark Chocolate', 'Intense dark chocolate milk for chocolate purists', 110, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Choco Vanilla', 'Perfect blend of chocolate and vanilla', 110, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Chocomalt', 'Nostalgic chocolate malt flavor', 110, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Purple Milk', 'Creamy ube (purple yam) flavored milk', 130, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Milk', 'Fresh strawberry blended with creamy milk', 130, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1591119/pexels-photo-1591119.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Blueberry Milk', 'Refreshing blueberry milk drink', 130, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mixberries Milk', 'Blend of strawberry, blueberry, and raspberry', 130, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Vanilla Milk', 'Classic vanilla-flavored milk', 110, 'non-coffee-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Black Forest', 'Rich chocolate with cherry and cream - a dessert in a cup', 150, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Oreo Milk', 'Premium combination of Biscoff spread and Oreo cookies', 150, 'non-coffee-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 4: Insert Adéia Verde (22oz) - Matcha Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Matcha Seasalt', 'Premium matcha green tea topped with sea salt cream', 150, 'adeia-verde-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Oreo', 'Authentic matcha blended with crushed Oreo cookies', 150, 'adeia-verde-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Latte', 'Classic Japanese matcha green tea with steamed milk', 140, 'adeia-verde-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Espresso', 'Bold combination of matcha and espresso shot', 140, 'adeia-verde-22oz', false, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Milo', 'Unique fusion of matcha and chocolate malt', 150, 'adeia-verde-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Choco Matcha', 'Perfect harmony of chocolate and matcha', 150, 'adeia-verde-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Matcha', 'Refreshing blend of strawberry and matcha green tea', 150, 'adeia-verde-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 5: Insert Fruit Soda (22oz) Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Blueberry Soda', 'Refreshing sparkling soda with blueberry flavor', 85, 'fruit-soda-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Soda', 'Sweet and fizzy strawberry soda', 85, 'fruit-soda-22oz', true, true, 'https://images.pexels.com/photos/1591119/pexels-photo-1591119.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Green Apple Soda', 'Crisp and tangy green apple flavored soda', 85, 'fruit-soda-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mixberries Soda', 'Sparkling mix of berry flavors', 85, 'fruit-soda-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Lychee Soda', 'Exotic lychee flavored sparkling drink', 85, 'fruit-soda-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 6: Insert Cheesecake Series (22oz) Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Purple Cheesecake', 'Creamy ube cheesecake blended into a smooth drink', 150, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheese Cheesecake', 'Classic cheesecake flavor in a drinkable form', 150, 'cheesecake-series-22oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Blueberry Cheesecake', 'Rich cheesecake with fresh blueberry swirls', 150, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Cheesecake', 'Creamy cheesecake with sweet strawberry', 150, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/1591119/pexels-photo-1591119.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Cheesecake', 'Premium cheesecake with Lotus Biscoff spread', 170, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Biscoff', 'Green tea cheesecake with Biscoff cookie crumbs', 170, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Biscoff', 'Strawberry cheesecake with Lotus Biscoff', 170, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/1591119/pexels-photo-1591119.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Blueberry Biscoff', 'Blueberry cheesecake meets Biscoff perfection', 170, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Latte Cheesecake', 'Coffee cheesecake with signature Biscoff spread', 170, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Cheesecake', 'Traditional matcha meets creamy cheesecake', 150, 'cheesecake-series-22oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 7: Insert Hot Coffee (12oz) Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Spanish Latte (Hot)', 'Rich hot espresso with sweetened condensed milk', 150, 'hot-coffee-12oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Caramel Macchiato (Hot)', 'Hot espresso with vanilla and caramel drizzle', 150, 'hot-coffee-12oz', true, true, 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Adéia Latte (Hot)', 'Our signature hot latte blend', 120, 'hot-coffee-12oz', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Milk (Hot)', 'Warm milk with Lotus Biscoff spread', 150, 'hot-coffee-12oz', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Purple Milk (Hot)', 'Hot ube-flavored milk', 130, 'hot-coffee-12oz', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Latte (Hot)', 'Traditional hot matcha green tea latte', 150, 'hot-coffee-12oz', true, true, 'https://images.pexels.com/photos/4021996/pexels-photo-4021996.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 8: Insert Quick Cravings Menu Items
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Creamy Buldak Overload', 'Spicy Korean fire noodles with creamy cheese sauce overload', 190, 'quick-cravings', true, true, 'https://images.pexels.com/photos/1907244/pexels-photo-1907244.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesy Pancit Canton', 'Filipino-style noodles loaded with cheese', 60, 'quick-cravings', false, true, 'https://images.pexels.com/photos/1907244/pexels-photo-1907244.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesy Fries Overload', 'Crispy fries smothered in melted cheese', 130, 'quick-cravings', true, true, 'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesy Nachos Overload', 'Tortilla chips loaded with cheese, salsa, and toppings', 130, 'quick-cravings', true, true, 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add size variation for Cheesy Nachos Overload
INSERT INTO variations (menu_item_id, name, price) VALUES
  ((SELECT id FROM menu_items WHERE name = 'Cheesy Nachos Overload' AND category = 'quick-cravings' LIMIT 1), 'Regular', 0),
  ((SELECT id FROM menu_items WHERE name = 'Cheesy Nachos Overload' AND category = 'quick-cravings' LIMIT 1), 'Large', 40);

-- ============================================================================
-- STEP 9: Insert Add-ons for Drinks (All Drink Categories)
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Espresso Shot', 'Add an extra shot of espresso to your drink', 35, 'drink-addons', false, true, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Caramel Drizzle', 'Sweet caramel sauce drizzle topping', 30, 'drink-addons', false, true, 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesecake Topping', 'Creamy cheesecake pieces for your drink', 40, 'drink-addons', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Oreo Topping', 'Crushed Oreo cookie pieces', 20, 'drink-addons', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Extra Milk', 'Add extra creamy milk to your drink', 35, 'drink-addons', false, true, 'https://images.pexels.com/photos/1638280/pexels-photo-1638280.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Spread', 'Rich Lotus Biscoff cookie butter spread', 40, 'drink-addons', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Crumbs', 'Crunchy Biscoff cookie crumbs topping', 40, 'drink-addons', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Biscoff Cookie', 'Whole Lotus Biscoff cookie on the side', 40, 'drink-addons', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- STEP 10: Insert Add-ons for Quick Cravings (Food)
-- ============================================================================

INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Extra Cheese', 'Additional melted cheese topping', 40, 'food-addons', false, true, 'https://images.pexels.com/photos/821365/pexels-photo-821365.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mayo', 'Creamy mayonnaise on the side', 20, 'food-addons', false, true, 'https://images.pexels.com/photos/1640771/pexels-photo-1640771.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Egg', 'Add a fried egg to your dish', 20, 'food-addons', false, true, 'https://images.pexels.com/photos/1457881/pexels-photo-1457881.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ============================================================================
-- SUCCESS MESSAGE
-- ============================================================================

-- Query to verify insertions
DO $$
DECLARE
  category_count INTEGER;
  item_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO category_count FROM categories WHERE id LIKE '%22oz%' OR id LIKE '%12oz%' OR id LIKE 'quick-cravings' OR id LIKE '%addons';
  SELECT COUNT(*) INTO item_count FROM menu_items WHERE category IN ('coffee-22oz', 'non-coffee-22oz', 'adeia-verde-22oz', 'fruit-soda-22oz', 'cheesecake-series-22oz', 'hot-coffee-12oz', 'quick-cravings', 'drink-addons', 'food-addons');
  
  RAISE NOTICE '============================================================================';
  RAISE NOTICE 'Adéia Café Menu Migration Complete!';
  RAISE NOTICE '============================================================================';
  RAISE NOTICE 'Categories created: %', category_count;
  RAISE NOTICE 'Menu items inserted: %', item_count;
  RAISE NOTICE '';
  RAISE NOTICE 'Summary:';
  RAISE NOTICE '  - Coffee (22oz): 14 items';
  RAISE NOTICE '  - Non-Coffee (22oz): 15 items';
  RAISE NOTICE '  - Adéia Verde (22oz): 7 items';
  RAISE NOTICE '  - Fruit Soda (22oz): 5 items';
  RAISE NOTICE '  - Cheesecake Series (22oz): 10 items';
  RAISE NOTICE '  - Hot Coffee (12oz): 6 items';
  RAISE NOTICE '  - Quick Cravings: 4 items';
  RAISE NOTICE '  - Drink Add-ons: 8 items';
  RAISE NOTICE '  - Food Add-ons: 3 items';
  RAISE NOTICE '============================================================================';
END $$;

