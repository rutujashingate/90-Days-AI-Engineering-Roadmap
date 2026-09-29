-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 4. WHERE: filter rows with comparisons and AND, OR, NOT.
SELECT '4. WHERE' AS lesson;

-- Expected: Maya and Liam.
SELECT name, city
FROM users
WHERE city = 'Phoenix'
ORDER BY user_id;

-- AND requires both conditions. Expected order IDs: 102, 104, 105.
SELECT *
FROM orders
WHERE amount > 50
  AND status = 'completed'
ORDER BY order_id;

-- OR requires at least one condition. Expected: Maya, Noah, Liam.
SELECT name, city
FROM users
WHERE city = 'Phoenix'
   OR name = 'Noah'
ORDER BY user_id;

-- NOT reverses a condition. Expected: all orders except 103.
SELECT *
FROM orders
WHERE NOT (status = 'cancelled')
ORDER BY order_id;

-- >= and <= include the boundary values. Expected IDs: 101, 102, 105.
SELECT order_id, amount
FROM orders
WHERE amount >= 50
  AND amount <= 80
ORDER BY order_id;

-- < means less than; != means not equal. Expected IDs: 101, 105.
SELECT order_id, amount, status
FROM orders
WHERE amount < 80
  AND status != 'cancelled'
ORDER BY order_id;
