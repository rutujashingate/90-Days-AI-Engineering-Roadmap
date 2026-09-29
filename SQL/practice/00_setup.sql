-- Run once in a fresh SQLite connection before choosing a topic file.
-- From the repository root, inside sqlite3: .read SQL/practice/00_setup.sql
-- See README.md in this folder for running one query at a time.

-- 0. CREATE TABLE defines columns; INSERT INTO adds rows.
SELECT '0. Create tables and insert sample rows' AS lesson;

-- SQLite needs this setting on each connection to enforce foreign keys.
PRAGMA foreign_keys = ON;

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT
);

-- PRIMARY KEY uniquely identifies an order.
-- FOREIGN KEY links each order to an existing user.
-- Amounts are whole-dollar integers here to match the examples in the notes.
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- There are three columns in users, but no rows yet. Expected: 0.
SELECT COUNT(*) AS users_before_insert
FROM users;

-- Each parenthesized group of values adds one row.
-- Emma has no orders, so we can see the difference between INNER and LEFT JOIN.
INSERT INTO users (user_id, name, city)
VALUES
    (1, 'Maya', 'Phoenix'),
    (2, 'Noah', 'Seattle'),
    (3, 'Liam', 'Phoenix'),
    (4, 'Emma', 'Seattle');

INSERT INTO orders (order_id, user_id, amount, status)
VALUES
    (101, 1, 50, 'completed'),
    (102, 2, 80, 'completed'),
    (103, 1, 30, 'cancelled'),
    (104, 3, 120, 'completed'),
    (105, 1, 70, 'completed');

-- Expected: 4. CREATE TABLE made the columns; INSERT INTO supplied the rows.
SELECT COUNT(*) AS users_after_insert
FROM users;
