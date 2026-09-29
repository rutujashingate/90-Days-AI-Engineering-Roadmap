-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 13. Indexes: help the database find matching rows as tables grow.
SELECT '13. CREATE INDEX' AS lesson;

-- Index the foreign key for queries by user. The users primary key already
-- supports finding users by ID. An index does not change query results.
-- IF NOT EXISTS lets you rerun this example without recreating the same index.
CREATE INDEX IF NOT EXISTS idx_orders_user_id
ON orders(user_id);

-- Expected IDs: 101, 103, 105. The database can use the index for this filter.
SELECT order_id, user_id, amount
FROM orders
WHERE user_id = 1
ORDER BY order_id;
