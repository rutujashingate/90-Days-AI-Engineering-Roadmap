-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 5. ORDER BY: sort rows. The order_id breaks ties when amounts are equal.
SELECT '5. ORDER BY' AS lesson;

-- DESC: 120, 80, 70, 50, 30.
SELECT order_id, amount
FROM orders
ORDER BY amount DESC, order_id;

-- ASC: 30, 50, 70, 80, 120.
SELECT order_id, amount
FROM orders
ORDER BY amount ASC, order_id;
