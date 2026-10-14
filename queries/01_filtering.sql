-- Day 1: Filtering (WHERE, ORDER BY, LIKE, IN, BETWEEN)

-- 1. All orders from the West region
SELECT order_id FROM superstore WHERE region = 'West';

-- 2. Orders with Sales above 500
SELECT sales FROM superstore WHERE sales > 500;

-- 3. Orders in the Technology category
SELECT order_id FROM superstore WHERE category = 'Technology';

-- 4. Orders with a negative Profit
SELECT order_id, profit FROM superstore WHERE profit < 0;

-- 5. Top 10 orders by Sales
SELECT order_id, sales FROM superstore ORDER BY sales DESC LIMIT 10;

-- 6. Bottom 10 orders by Profit
SELECT order_id, profit FROM superstore ORDER BY profit LIMIT 10;

-- 7. Orders shipped by "Same Day"   (you asked for a hint on this one)
SELECT order_id FROM superstore WHERE ship_mode = 'Same Day';

-- 8. Orders in Furniture or Technology (use IN)
SELECT order_id FROM superstore WHERE category IN ('Furniture', 'Technology');

-- 9. Orders with Sales between 100 and 300
SELECT order_id, sales FROM superstore WHERE sales BETWEEN 100 AND 300;

-- 10. Customers whose name starts with "A"
SELECT customer_name FROM superstore WHERE customer_name LIKE 'A%';

-- 11. Cities that contain "ville"
SELECT city FROM superstore WHERE city LIKE '%ville%';

-- 12. Consumer segment, sorted by Profit descending
SELECT order_id FROM superstore WHERE segment = 'Consumer' ORDER BY profit DESC;

-- 13. Discount above 0.3 and Profit below 0
SELECT order_id FROM superstore WHERE discount > 0.3 AND profit < 0;

-- 14. Orders in California or Texas, sorted by Sales
SELECT order_id, state FROM superstore WHERE state IN ('California', 'Texas') ORDER BY sales;

-- 15. Profit not between 0 and 50
SELECT order_id, profit FROM superstore WHERE profit NOT BETWEEN 0 AND 50;