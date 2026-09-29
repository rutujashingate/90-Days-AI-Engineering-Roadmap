-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 2. AS: give result columns clearer names.
SELECT '2. AS' AS lesson;

SELECT
    name AS user_name,
    city AS user_city
FROM users
ORDER BY user_id;

-- Expected: 70.0. This includes all five orders, including the cancelled one.
SELECT AVG(amount) AS average_order_value
FROM orders;
