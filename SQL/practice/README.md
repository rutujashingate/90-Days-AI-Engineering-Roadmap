# SQL practice: one query or topic at a time

Start with `00_setup.sql` to create the sample tables and insert four users and five orders. Then choose any topic file. The numbers follow the Day 4 notes, but you can run topics in any order after setup.

## Run one query at a time

From the repository root, open an interactive SQLite session:

```bash
sqlite3 -header -column -nullvalue NULL ':memory:'
```

At the `sqlite>` prompt, load the setup file once:

```text
.read SQL/practice/00_setup.sql
```

Now type or paste one complete query and press Enter:

```sql
SELECT name, city
FROM users
WHERE city = 'Phoenix';
```

This returns Maya and Liam. SQL statements execute when you finish them with a semicolon (`;`). For a multi-line query, keep typing until the final semicolon. You can copy a single statement from any topic file, including the full `WITH ... SELECT ...` statement for a CTE.

Keep using this same session so the tables remain available. Starting another `sqlite3 ':memory:'` command creates a separate, empty database. Use `.quit` when you are finished; closing the session discards its in-memory database.

## Run one topic file

After setup, type this at the same `sqlite>` prompt to run every query in the WHERE lesson:

```text
.read SQL/practice/04_where.sql
```

Choose another file whenever you want:

```text
.read SQL/practice/07_aggregates.sql
.read SQL/practice/10_joins.sql
```

`.read` runs a whole file. To execute just one query, copy that statement into the prompt instead. Dot commands such as `.read` and `.quit` do not need semicolons. All paths here assume you started SQLite from the repository root. See the [SQLite shell documentation](https://www.sqlite.org/cli.html) for interactive commands.

| File | What to practice |
| --- | --- |
| [00_setup.sql](./00_setup.sql) | Create columns, insert rows, and relate users to orders |
| [01_select.sql](./01_select.sql) | Read all or selected columns |
| [02_aliases.sql](./02_aliases.sql) | Rename result columns with `AS` |
| [03_distinct.sql](./03_distinct.sql) | Return unique values |
| [04_where.sql](./04_where.sql) | Filter with comparisons, `AND`, `OR`, and `NOT` |
| [05_order_by.sql](./05_order_by.sql) | Sort ascending or descending |
| [06_limit.sql](./06_limit.sql) | Return a limited number of rows |
| [07_aggregates.sql](./07_aggregates.sql) | Use `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX` |
| [08_group_by.sql](./08_group_by.sql) | Summarize each group |
| [09_having.sql](./09_having.sql) | Filter grouped results with `HAVING` |
| [10_joins.sql](./10_joins.sql) | Combine tables with `INNER JOIN` and `LEFT JOIN` |
| [11_ctes.sql](./11_ctes.sql) | Name an intermediate result with `WITH` |
| [12_window_functions.sql](./12_window_functions.sql) | Calculate totals and rankings while keeping rows |
| [13_indexes.sql](./13_indexes.sql) | Create an index for lookups by user |
| [14_insert_update.sql](./14_insert_update.sql) | Insert a practice row and update its status |
| [15_delete.sql](./15_delete.sql) | Insert and delete a practice row |

The insert/update and delete lessons each use their own practice row inside a transaction. `BEGIN TRANSACTION` starts the transaction, and `ROLLBACK` undoes its changes at the end. This keeps the original sample rows available when you repeat a lesson or switch topics. If you execute these lessons one statement at a time, finish with `ROLLBACK;` before starting another lesson. See the [SQLite transaction documentation](https://www.sqlite.org/lang_transaction.html).

## Use a SQL editor

Connect to a fresh SQLite database and run `00_setup.sql` once. Then open a topic file, select one complete SQL statement, and use your editor's **Run selected query** action. Keep using the same database connection.

The numbered files contain SQL you can run in an editor. The `.read` commands and the all-topics runner are for the SQLite command-line shell.

## Reset the sample data

At the SQLite prompt, open a fresh in-memory database and reload setup:

```text
.open :memory:
.read SQL/practice/00_setup.sql
```

This starts over with the original sample data. Run setup once per fresh database; it creates the tables rather than replacing existing ones.

## Run everything

To run all the files in sequence and print their results, use this terminal command from the repository root:

```bash
sqlite3 -bail -header -column -nullvalue NULL ':memory:' < SQL/Day_4_SQL_Practice.sql
```

The [runner](../Day_4_SQL_Practice.sql) loads the numbered files, so each example is maintained in one place.
