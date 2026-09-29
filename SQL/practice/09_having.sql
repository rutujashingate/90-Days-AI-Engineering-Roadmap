-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 9. WHERE filters rows before grouping; HAVING filters grouped results.
SELECT '9. WHERE vs HAVING' AS lesson;

-- Completed totals: 1 -> 120, 2 -> 80, 3 -> 120.
SELECT
    user_id,
    SUM(amount) AS completed_total
FROM orders
WHERE status = 'completed'
GROUP BY user_id
ORDER BY user_id;

-- All-order totals above 100: user 1 (150), user 3 (120).
SELECT
    user_id,
    SUM(amount) AS total_spent
FROM orders
GROUP BY user_id
HAVING SUM(amount) > 100
ORDER BY user_id;

-- At least two completed orders and more than 100 spent: user 1, 2 orders, 120.
SELECT
    user_id,
    COUNT(*) AS completed_orders,
    SUM(amount) AS completed_total
FROM orders
WHERE status = 'completed'
GROUP BY user_id
HAVING COUNT(*) >= 2
   AND SUM(amount) > 100
ORDER BY user_id;
