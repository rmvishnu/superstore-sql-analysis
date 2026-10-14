-- Day 2: Aggregation and Grouping (COUNT, SUM, AVG, GROUP BY, HAVING)

-- 1. Total number of rows
SELECT COUNT(*) FROM superstore;

-- 2. Total sales
SELECT SUM(sales) FROM superstore;

-- 3. Average profit
SELECT AVG(profit) FROM superstore;

-- 4. Highest and lowest sales in one query
SELECT MAX(sales) AS highest, MIN(sales) AS lowest FROM superstore;

-- 5. Rows per region   (you left this blank)
SELECT region, COUNT(*) AS orders FROM superstore GROUP BY region;

-- 6. Total sales per category
SELECT SUM(sales), category FROM superstore GROUP BY category;

-- 7. Total profit per region
SELECT SUM(profit), region FROM superstore GROUP BY region;

-- 8. Average discount per sub_category
SELECT AVG(discount), sub_category FROM superstore GROUP BY sub_category;

-- 9. Total sales and profit per category, biggest sales first
SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- 10. Rows per ship_mode   (you couldn't understand this one at first)
SELECT ship_mode, COUNT(*) AS orders FROM superstore GROUP BY ship_mode;

-- 11. Total sales per category, Consumer segment only
SELECT category, SUM(sales)
FROM superstore
WHERE segment = 'Consumer'
GROUP BY category;

-- 12. Categories with total sales above 730,000
SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category
HAVING SUM(sales) > 730000;

-- 13. Sub-categories with negative total profit
SELECT sub_category, SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING total_profit < 0;

-- 14. Regions whose average discount is above 0.15
SELECT region, AVG(discount) AS avg_dis
FROM superstore
GROUP BY region
HAVING avg_dis > 0.15;

-- 15. Top 5 states by total profit
SELECT state, SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC, state
LIMIT 5;