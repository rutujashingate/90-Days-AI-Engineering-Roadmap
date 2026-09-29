-- First load SQL/practice/00_setup.sql once in the same SQLite connection.
-- Run this whole file, or copy one complete SQL statement ending in a semicolon.

-- 3. DISTINCT: remove duplicate values from the result.
SELECT '3. DISTINCT' AS lesson;

-- Expected: Phoenix and Seattle, once each.
SELECT DISTINCT city
FROM users
ORDER BY city;
