-- Day 3: JOINs (INNER, LEFT, RIGHT, anti-join)
-- Setup: practice tables so this file can be rerun
CREATE TABLE da_practice.customers (customer_id INT, name VARCHAR(50), city VARCHAR(50));
INSERT INTO da_practice.customers VALUES
(1,'Asha','Chennai'),(2,'Ravi','Mumbai'),(3,'Meena','Chennai'),(4,'Karthik','Delhi'),(5,'Divya','Pune');
CREATE TABLE da_practice.orders (order_id INT, customer_id INT, amount INT);
INSERT INTO da_practice.orders VALUES
(101,1,500),(102,1,300),(103,2,700),(104,3,200),(105,6,900);
CREATE TABLE da_practice.customers_sf AS
SELECT DISTINCT customer_id, customer_name, segment FROM da_practice.superstore;
CREATE TABLE da_practice.orders_sf AS
SELECT order_id, customer_id, category, region, sales, profit FROM da_practice.superstore;

-- 1. Every order with the customer's name (INNER: only matched rows)
SELECT o.order_id, c.name
FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 2. Orders above 300 with name and city (INNER, filter rows with WHERE)
SELECT o.order_id, c.name, c.city, o.amount
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
WHERE o.amount > 300;

-- 3. Total amount per customer (INNER + GROUP BY)
SELECT SUM(o.amount) AS total_amount, c.name
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;

-- 4. All customers, including those with no orders (LEFT: keep all customers)
SELECT c.name, o.order_id
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 5. Customers who never ordered (anti-join: LEFT JOIN + IS NULL in WHERE)
SELECT c.name, o.order_id
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 6. All orders, including the one with a missing customer (RIGHT: keep all orders)
SELECT c.name, o.order_id
FROM customers c RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- 7. Orders per customer, 0 where none (keep all customers; COUNT a column, not *)
SELECT COUNT(o.order_id), c.name
FROM orders o RIGHT JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name;

-- 8. Total amount per city (INNER + GROUP BY)
SELECT SUM(o.amount) AS total_amount, c.city
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city;

-- 9. Customers with total above 600 (HAVING filters groups)
SELECT c.name, SUM(o.amount) AS total_amount
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name HAVING total_amount > 600;

-- 10. Q1 with aliases c and o
SELECT o.order_id, c.name
FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 11. Top 10 customers by total sales (Superstore split tables)
SELECT c.customer_name, SUM(o.sales) AS total_sales
FROM customers_sf c JOIN orders_sf o ON o.customer_id = c.customer_id
GROUP BY c.customer_name ORDER BY total_sales DESC, c.customer_name LIMIT 10;

-- 12. Total sales per segment
SELECT c.segment, SUM(o.sales) AS total_sales
FROM customers_sf c JOIN orders_sf o ON o.customer_id = c.customer_id
GROUP BY c.segment ORDER BY total_sales DESC;

-- 13. Customers with negative total profit
SELECT c.customer_name, SUM(o.profit) AS total_profit
FROM customers_sf c JOIN orders_sf o ON o.customer_id = c.customer_id
GROUP BY c.customer_name HAVING total_profit < 0;

-- 14. Number of different customers per category
SELECT o.category, COUNT(DISTINCT c.customer_name) AS customers
FROM customers_sf c JOIN orders_sf o ON o.customer_id = c.customer_id
GROUP BY o.category;

-- 15. Top 5 customers by sales in Technology (WHERE filters rows before grouping)
SELECT c.customer_name, SUM(o.sales) AS total_sales
FROM customers_sf c JOIN orders_sf o ON c.customer_id = o.customer_id
WHERE o.category = 'Technology'
GROUP BY c.customer_name
ORDER BY total_sales DESC, c.customer_name
LIMIT 5;