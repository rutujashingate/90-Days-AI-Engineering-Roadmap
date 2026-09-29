-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 8. GROUP BY: calculate separately for each group.
SELECT '8. GROUP BY' AS lesson;

-- Expected user totals: 1 -> 150, 2 -> 80, 3 -> 120.
-- This example includes cancelled orders; section 9 filters them out.
SELECT
    user_id,
    SUM(amount) AS total_spent
FROM orders
GROUP BY user_id
ORDER BY user_id;

-- Expected: cancelled -> 1, completed -> 4.
SELECT
    status,
    COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY status;
