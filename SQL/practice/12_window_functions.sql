-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 12. Window functions: calculate across related rows while keeping each row.
SELECT '12. Window functions' AS lesson;

-- All five orders remain. User 1's total of 150 appears beside each of her orders.
SELECT
    order_id,
    user_id,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id
    ) AS user_total
FROM orders
ORDER BY user_id, order_id;

-- Rank each user's orders, largest first. User 1's order IDs rank 105, 101, 103.
SELECT
    order_id,
    user_id,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY amount DESC, order_id
    ) AS order_rank
FROM orders
ORDER BY user_id, order_rank;

-- Use a CTE to filter the calculated rank: each user's largest order.
-- Expected order IDs by user: 105, 102, 104.
WITH ranked_orders AS (
    SELECT
        order_id,
        user_id,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY amount DESC, order_id
        ) AS order_rank
    FROM orders
)
SELECT user_id, order_id, amount
FROM ranked_orders
WHERE order_rank = 1
ORDER BY user_id;
