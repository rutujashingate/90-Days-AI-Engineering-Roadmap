-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 15. DELETE: remove a row while keeping the table and its columns.
SELECT '15. DELETE the practice order' AS lesson;

-- This lesson creates its own practice row; no UPDATE lesson is required first.
-- Finish with ROLLBACK when running the statements individually.
BEGIN TRANSACTION;

INSERT INTO orders (order_id, user_id, amount, status)
VALUES (106, 4, 40, 'pending');

-- Before deletion: one matching row.
SELECT *
FROM orders
WHERE order_id = 106;

-- WHERE limits deletion to order 106. Without it, every order would be removed.
DELETE FROM orders
WHERE order_id = 106;

-- Expected: 0, because the practice order was deleted.
SELECT COUNT(*) AS remaining_practice_orders
FROM orders
WHERE order_id = 106;

-- Undo the transaction so this lesson can be repeated independently.
ROLLBACK;

-- Back to the original five orders and total of 350.
SELECT
    COUNT(*) AS final_order_count,
    SUM(amount) AS final_total_amount
FROM orders;
