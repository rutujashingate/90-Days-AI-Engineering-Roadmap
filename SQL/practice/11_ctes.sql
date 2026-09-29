-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 11. CTEs: name an intermediate result for use within this one statement.
SELECT '11. Common Table Expressions' AS lesson;

-- Expected: user 1 (150), user 3 (120).
WITH user_totals AS (
    SELECT
        user_id,
        SUM(amount) AS total_spent
    FROM orders
    GROUP BY user_id
)
SELECT *
FROM user_totals
WHERE total_spent > 100
ORDER BY user_id;
