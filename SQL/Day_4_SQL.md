# Day 4/90: SQL

## What is SQL?

SQL stands for **Structured Query Language**.

```text
S → Structured
Q → Query
L → Language
```

### Structured

The data follows an organized structure, usually in the form of tables containing rows and columns.

### Query

A query is simply a question or request for data.

For example:

- Which users live in Phoenix?
- What is the average order value?

### Language

SQL gives us a language for expressing those questions:

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
JOIN
```

So the easiest way for me to remember SQL is:

> SQL is a language for asking databases questions and working with the data stored inside them.

## What is a Database?

A database is an organized system for storing, retrieving, and managing data.

Applications need somewhere persistent to store information instead of keeping everything only inside Python variables, spreadsheets, or temporary files.

An AI application might store:

- users
- conversations
- messages
- documents
- model_runs
- feedback
- recommendations

For today’s examples, imagine we have two tables.

- `users`
- `orders`

These tables are related through `user_id`.

```text
users.user_id
      ↕
orders.user_id
```

In real AI systems, a lot of useful information lives in databases.

So even if your main job is building models, RAG systems, or agents, you will eventually need to ask questions like:

- Which users were active this week?
- What is the average order value?
- Which model version has the highest success rate?
- How many conversations failed yesterday?
- What are the top products for each user?

SQL is the language we use to ask those questions.

## 1. SELECT

`SELECT` tells SQL what data we want.

```sql
SELECT *
FROM users;
```

`*` means all columns.

If we only want specific columns:

```sql
SELECT name, city
FROM users;
```

Think:

```text
SELECT → what do I want?
FROM   → where should I get it from?
```

## 2. Rename Columns with AS

Sometimes the original column name isn’t very readable.

We can give it another name in the query result using `AS`.

```sql
SELECT
    name AS user_name,
    city AS user_city
FROM users;
```

Result:

| user_name | user_city |
| --- | --- |
| Maya | Phoenix |
| Noah | Seattle |
| Liam | Phoenix |

This is especially useful for calculations:

```sql
SELECT AVG(amount) AS average_order_value
FROM orders;
```

So:

```text
AS → give a column a clearer name in the result
```

It does not permanently rename the database column.

## 3. DISTINCT

Sometimes a column contains repeated values.

```sql
SELECT city
FROM users;
```

might return:

```text
Phoenix
Seattle
Phoenix
```

If we only want unique values:

```sql
SELECT DISTINCT city
FROM users;
```

Result:

```text
Phoenix
Seattle
```

So:

```text
DISTINCT → remove duplicate values from the result
```

## 4. WHERE

`WHERE` filters individual rows.

```sql
SELECT *
FROM orders
WHERE amount > 50;
```

Or combine conditions:

```sql
SELECT *
FROM orders
WHERE amount > 50
  AND status = 'completed';
```

Common operators include:

```text
=    equal
!=   not equal
>    greater than
<    less than
>=   greater than or equal
<=   less than or equal
```

And conditions can be combined using:

```sql
AND
OR
NOT
```

The important thing to remember:

> WHERE filters raw rows before grouping and aggregation.

## 5. ORDER BY

`ORDER BY` sorts the result.

```sql
SELECT *
FROM orders
ORDER BY amount DESC;
```

`DESC` means descending:

```text
120
80
70
50
30
```

For smallest to largest:

```sql
ORDER BY amount ASC;
```

`ASC` means ascending.

Useful for questions such as:

- Which orders are the largest?
- Which model runs had the lowest latency?
- Which recommendations have the highest scores?

## 6. LIMIT

Sometimes a query could return thousands of rows.

`LIMIT` lets us control how many we get back.

```sql
SELECT *
FROM orders
LIMIT 3;
```

Combine it with sorting:

```sql
SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 3;
```

Now we’re asking:

> Give me the three largest orders.

A very common pattern is:

```text
ORDER BY + LIMIT
        ↓
     Top N
```

## 7. Aggregate Functions

Aggregate functions summarize multiple rows.

The most common ones are:

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

### Count rows

```sql
SELECT COUNT(*)
FROM orders;
```

Result:

```text
5
```

### Count unique users

```sql
SELECT COUNT(DISTINCT user_id)
FROM orders;
```

If the orders belong to:

```text
1
2
1
3
1
```

there are only three unique users.

Result:

```text
3
```

### Total

```sql
SELECT SUM(amount)
FROM orders;
```

### Average

```sql
SELECT AVG(amount)
FROM orders;
```

Our values are:

```text
50, 80, 30, 120, 70
```

Total:

```text
350
```

Number of rows:

```text
5
```

Average:

```text
350 / 5 = 70
```

### Minimum and maximum

```sql
SELECT
    MIN(amount) AS smallest_order,
    MAX(amount) AS largest_order
FROM orders;
```

## 8. GROUP BY

Aggregates become much more useful when combined with `GROUP BY`.

Suppose we want:

> How much has each user spent?

```sql
SELECT
    user_id,
    SUM(amount) AS total_spent
FROM orders
GROUP BY user_id;
```

Conceptually:

```text
User 1
50
30
70
→ 150

User 2
80
→ 80

User 3
120
→ 120
```

Result:

| user_id | total_spent |
| --- | --- |
| 1 | 150 |
| 2 | 80 |
| 3 | 120 |

`GROUP BY` allows us to calculate something separately for each group.

Another example:

```sql
SELECT
    status,
    COUNT(*) AS order_count
FROM orders
GROUP BY status;
```

This answers:

> How many orders exist for each status?

## 9. WHERE vs HAVING

This is an important distinction.

Both filter data, but they work at different stages.

### WHERE

`WHERE` filters individual rows before grouping.

```sql
SELECT
    user_id,
    SUM(amount) AS total_spent
FROM orders
WHERE status = 'completed'
GROUP BY user_id;
```

Here:

```sql
WHERE status = 'completed'
```

removes cancelled orders before calculating the totals.

Think:

```text
raw rows
   ↓
WHERE
   ↓
GROUP BY
   ↓
SUM
```

### HAVING

`HAVING` filters after the rows have been grouped and aggregated.

Suppose we want:

> Show users whose total spending is above $100.

```sql
SELECT
    user_id,
    SUM(amount) AS total_spent
FROM orders
GROUP BY user_id
HAVING SUM(amount) > 100;
```

We’re filtering using:

```sql
SUM(amount)
```

which only exists after the grouping has happened.

So:

```text
WHERE
→ filter raw rows

HAVING
→ filter grouped results
```

We can even use both:

```sql
SELECT
    user_id,
    COUNT(*) AS completed_orders
FROM orders
WHERE status = 'completed'
GROUP BY user_id
HAVING COUNT(*) >= 2;
```

Read it as:

```text
WHERE
→ keep completed orders

GROUP BY
→ group them by user

COUNT
→ count orders for each user

HAVING
→ keep users with at least 2
```

That’s the difference I want to remember.

## 10. JOIN

Real databases usually contain multiple related tables.

Our `orders` table knows the:

```text
user_id
```

but not the user’s:

```text
name
city
```

Those live inside `users`.

A `JOIN` combines related data from two tables.

```sql
SELECT
    users.name,
    orders.amount
FROM users
JOIN orders
    ON users.user_id = orders.user_id;
```

This part:

```sql
ON users.user_id = orders.user_id
```

means:

> Match orders with users that have the same user_id.

Result:

| name | amount |
| --- | --- |
| Maya | 50 |
| Noah | 80 |
| Maya | 30 |
| Liam | 120 |
| Maya | 70 |

Now we can ask more useful questions.

For example:

> How much has each person spent?

```sql
SELECT
    users.name,
    SUM(orders.amount) AS total_spent
FROM users
JOIN orders
    ON users.user_id = orders.user_id
GROUP BY users.name;
```

### Common JOIN types

For now, the two I want to remember are:

#### INNER JOIN

Use `INNER JOIN` when you only want records that exist in both tables.

```sql
SELECT
    users.name,
    orders.amount
FROM users
INNER JOIN orders
    ON users.user_id = orders.user_id;
```

Emma is missing because there is no matching row in `orders`.

#### LEFT JOIN

A `LEFT JOIN` is useful when you want to keep every row from the main table, even when there is no matching record in the other table.

```sql
SELECT
    users.name,
    orders.amount
FROM users
LEFT JOIN orders
    ON users.user_id = orders.user_id;
```

## 11. CTEs

CTE stands for **Common Table Expression**.

A CTE lets us break a larger query into smaller, more readable steps.

It starts with:

```sql
WITH
```

Example:

```sql
WITH user_totals AS (
    SELECT
        user_id,
        SUM(amount) AS total_spent
    FROM orders
    GROUP BY user_id
)

SELECT *
FROM user_totals;
```

Think:

```text
orders
   ↓
calculate totals
   ↓
call the result user_totals
   ↓
query user_totals
```

Now we could do:

```sql
WITH user_totals AS (
    SELECT
        user_id,
        SUM(amount) AS total_spent
    FROM orders
    GROUP BY user_id
)

SELECT *
FROM user_totals
WHERE total_spent > 100;
```

CTEs become useful when SQL starts getting larger and harder to read.

## 12. Window Functions

A window function lets us calculate something across related rows without removing the original rows.

Suppose we have:

| user_id | amount |
| --- | --- |
| 1 | 50 |
| 1 | 30 |
| 1 | 70 |
| 2 | 80 |

With `GROUP BY`, User 1 could become:

```text
1 | 150
```

We lose the individual orders.

But sometimes we want the original orders and the user’s total.

```sql
SELECT
    order_id,
    user_id,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id
    ) AS user_total
FROM orders;
```

Result:

| order_id | user_id | amount | user_total |
| --- | --- | --- | --- |
| 101 | 1 | 50 | 150 |
| 103 | 1 | 30 | 150 |
| 105 | 1 | 70 | 150 |
| 102 | 2 | 80 | 80 |

The rows stay.

We just add another calculation.

```sql
PARTITION BY user_id
```

means:

> Calculate separately for each user.

Window functions are also useful for ranking.

```sql
ROW_NUMBER() OVER (
    PARTITION BY user_id
    ORDER BY amount DESC
)
```

This could help find:

- Each user’s largest order
- The highest-ranked recommendation per user
- The latest event for each customer

For now, the important idea is:

> GROUP BY can collapse rows. Window functions let us calculate across groups while keeping the rows.

## 13. Indexes

Indexes are slightly different from everything else here.

Most SQL commands answer:

> What data do I want?

Indexes are about:

> How efficiently can the database find it?

Imagine a table containing:

```text
100,000,000 users
```

and we query:

```sql
SELECT *
FROM users
WHERE user_id = 48201934;
```

Without an appropriate index, finding the row may require scanning a large amount of data.

We can create an index:

```sql
CREATE INDEX idx_users_user_id
ON users(user_id);
```

A simple analogy is a book.

Without an index:

```text
search page by page
```

With one:

```text
look up the topic
↓
jump to the relevant location
```

Indexes are commonly useful for columns frequently involved in:

```sql
WHERE
JOIN
ORDER BY
```

But indexes aren’t free.

They:

- use additional storage
- add work when inserting rows
- add work when updating rows
- add work when deleting rows

So the simple rule I’m remembering is:

> Indexes can make certain reads faster, but they have storage and write costs.

That’s enough index knowledge for Day 4.

## Day 4 Quick Reference

```sql
SELECT name, city
FROM users;
-- select columns


SELECT name AS user_name
FROM users;
-- rename a result column


SELECT DISTINCT city
FROM users;
-- unique values


SELECT *
FROM orders
WHERE amount > 50;
-- filter raw rows


SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 10;
-- sort + top 10


SELECT COUNT(*)
FROM orders;
-- count rows


SELECT COUNT(DISTINCT user_id)
FROM orders;
-- count unique users


SELECT SUM(amount)
FROM orders;
-- total


SELECT AVG(amount)
FROM orders;
-- average


SELECT
    user_id,
    SUM(amount)
FROM orders
GROUP BY user_id;
-- aggregate by user


SELECT
    user_id,
    SUM(amount)
FROM orders
GROUP BY user_id
HAVING SUM(amount) > 100;
-- filter grouped results


SELECT *
FROM users
JOIN orders
    ON users.user_id = orders.user_id;
-- combine related tables
```

SQL isn’t really about memorizing every command.

The bigger skill is being able to take a question like:

> Which users placed at least two completed orders and spent more than $100?

and break it into operations on the data.

For Day 4, this is enough foundation to move forward. There is much more SQL to learn—NULL, CASE, subqueries, modifying data, transactions, query plans, database design—but those will make more sense once the basics above feel natural.

## Practice — Don’t Just Read

Open a small database and try writing queries for:

- users from a specific city
- the top 5 largest orders
- the number of unique users
- the average order amount
- total spending per user
- users whose total spending exceeds $100
- users joined with their orders
- ranking each user’s orders from highest to lowest

Don’t worry about remembering every piece of syntax immediately.

The goal is to get comfortable turning a question into a query.

Practice, don’t just read. Happy learning:)
