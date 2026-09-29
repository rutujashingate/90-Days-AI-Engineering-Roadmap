-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 7. Aggregate functions: summarize several rows in one result.
SELECT '7. COUNT, SUM, AVG, MIN, MAX' AS lesson;

-- Expected: 5 orders, 3 ordering users, total 350, average 70, min 30, max 120.
SELECT
    COUNT(*) AS order_count,
    COUNT(DISTINCT user_id) AS users_with_orders,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount,
    MIN(amount) AS smallest_order,
    MAX(amount) AS largest_order
FROM orders;
