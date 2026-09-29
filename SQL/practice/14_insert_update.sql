-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 14. UPDATE: change values in an existing row.
SELECT '14. INSERT and UPDATE a practice order' AS lesson;

-- BEGIN groups these changes; ROLLBACK at the end undoes them for repeat practice.
-- When running one statement at a time, finish with ROLLBACK before another topic.
BEGIN TRANSACTION;

-- Add a practice row so we can inspect it before and after UPDATE.
INSERT INTO orders (order_id, user_id, amount, status)
VALUES (106, 4, 40, 'pending');

SELECT *
FROM orders
WHERE order_id = 106;

-- WHERE limits the change to order 106. Without it, every order would be updated.
UPDATE orders
SET status = 'completed'
WHERE order_id = 106;

-- The same row now has status completed.
SELECT *
FROM orders
WHERE order_id = 106;

-- Undo the practice INSERT and UPDATE. The original five orders remain.
ROLLBACK;
