-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 1. SELECT: read all columns, or choose specific columns.
SELECT '1. SELECT' AS lesson;

SELECT *
FROM users
ORDER BY user_id;

SELECT name, city
FROM users
ORDER BY user_id;

SELECT *
FROM orders
ORDER BY order_id;
