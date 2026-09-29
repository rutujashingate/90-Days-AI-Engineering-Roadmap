-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 6. LIMIT: control how many rows come back.
SELECT '6. LIMIT' AS lesson;

-- First three orders by ID: 101, 102, 103.
SELECT *
FROM orders
ORDER BY order_id
LIMIT 3;

-- Three largest orders: 104 (120), 102 (80), 105 (70).
SELECT order_id, amount
FROM orders
ORDER BY amount DESC, order_id
LIMIT 3;
