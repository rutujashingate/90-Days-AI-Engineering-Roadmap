-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 10. JOIN: combine related rows from different tables.
SELECT '10. INNER JOIN and LEFT JOIN' AS lesson;

-- INNER JOIN returns five matching rows. Emma is absent because she has no orders.
SELECT
    users.name,
    orders.order_id,
    orders.amount
FROM users
INNER JOIN orders
    ON users.user_id = orders.user_id
ORDER BY orders.order_id;

-- LEFT JOIN returns six rows: the five matches plus Emma with NULL order fields.
SELECT
    users.name,
    orders.order_id,
    orders.amount
FROM users
LEFT JOIN orders
    ON users.user_id = orders.user_id
ORDER BY users.user_id, orders.order_id;

-- Combine JOIN and GROUP BY. Count order IDs, so Emma's NULL match counts as zero.
-- Expected: Maya 3, Noah 1, Liam 1, Emma 0.
SELECT
    users.user_id,
    users.name,
    COUNT(orders.order_id) AS order_count
FROM users
LEFT JOIN orders
    ON users.user_id = orders.user_id
GROUP BY users.user_id, users.name
ORDER BY users.user_id;
