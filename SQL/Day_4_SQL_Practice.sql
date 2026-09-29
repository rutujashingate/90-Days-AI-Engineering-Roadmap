-- Day 4: run every SQL practice topic with the SQLite command-line tool.
-- Run from the repository root:
-- sqlite3 -bail -header -column -nullvalue NULL ':memory:' < SQL/Day_4_SQL_Practice.sql
-- For one query or topic at a time, see SQL/practice/README.md.
-- .read is a SQLite shell command. In a SQL editor, open the topic files instead.
-- Paths below are relative to the repository root, where you start sqlite3.

.read SQL/practice/00_setup.sql
.read SQL/practice/01_select.sql
.read SQL/practice/02_aliases.sql
.read SQL/practice/03_distinct.sql
.read SQL/practice/04_where.sql
.read SQL/practice/05_order_by.sql
.read SQL/practice/06_limit.sql
.read SQL/practice/07_aggregates.sql
.read SQL/practice/08_group_by.sql
.read SQL/practice/09_having.sql
.read SQL/practice/10_joins.sql
.read SQL/practice/11_ctes.sql
.read SQL/practice/12_window_functions.sql
.read SQL/practice/13_indexes.sql
.read SQL/practice/14_insert_update.sql
.read SQL/practice/15_delete.sql
