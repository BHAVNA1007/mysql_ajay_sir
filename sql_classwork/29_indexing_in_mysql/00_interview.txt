Q1. What is an index?

Answer:

An index is a data structure that helps MySQL find and retrieve rows more efficiently, especially for queries that search, sort, or join using indexed columns.

Q2. Why do we use indexes?

Answer:

We use indexes to improve query performance by allowing MySQL to locate required rows more efficiently instead of scanning the entire table when an appropriate index can be used.

Q3. Does an index contain the entire table?

Answer:

No.

An index stores indexed column values along with information that allows MySQL to locate the corresponding rows.

Q4. Does creating an index always make a query faster?

Answer:

No.

MySQL's optimizer decides whether to use the index.

For some queries, a table scan can actually be cheaper than using an index.

Q5. Does a primary key automatically have an index?

Answer:

Yes.

In MySQL, defining a primary key creates a primary index automatically.

Q6. Can we create multiple indexes on one table?

Answer:

Yes.

For example:

employees
│
├── PRIMARY
├── idx_employee_name
├── idx_salary
└── idx_city

But creating too many indexes is not good.

Why?

Because indexes also consume storage and need to be maintained when data is inserted, updated, or deleted.

10. Most Important Trade-off

Remember this:

Indexes
   ↓
Faster SELECT
   ↓
BUT
   ↓
More storage
   +
Extra maintenance during INSERT/UPDATE/DELETE

So:

Indexes improve read performance but can add overhead to write operations.

This is one of the most frequently asked interview concepts.

🔥 Cross Question

Interviewer: If indexes make searching faster, why don't we create indexes on every column?

Answer:

Because indexes have a cost. They consume additional storage and must be maintained when rows are inserted, updated, or deleted. Too many indexes can therefore slow down write operations and increase storage usage.


Q1. Are these the same?
INDEX(department, city)

and:

INDEX(city, department)

Answer: No.

They contain the same columns but have different column orders, and that affects which queries can efficiently use the leading portion of the index.

Q2. What is the leftmost-prefix rule?

Answer:

A composite index can generally be used efficiently for its leftmost/leading columns and combinations that preserve that leading portion.

For:

(department, city)

the leading portion is:

department

and then:

department + city
Q3. Does the order of conditions in WHERE have to match the index order?

Answer:

No.

For example:

WHERE city = 'Bhopal'
AND department = 'IT'

can still use an index on:

(department, city)

because the optimizer can analyze the predicates. The important thing is the index's column order, not the textual order in the WHERE clause.



Q: Does Primary Key automatically create an index in MySQL?

Answer:
Yes. In MySQL, defining a Primary Key automatically creates a unique index for the Primary Key column(s).

Cross-question

Q: Can a table have more than one Primary Key?

❌ No.

A table can have only one Primary Key, but that Primary Key can contain multiple columns:

PRIMARY KEY (employee_id, department)

That is called a composite primary key.



Can we drop the Primary Key index?
====================================
You cannot simply drop the index behind a Primary Key while keeping the Primary Key constraint.







Point 20: Final Interview + Cross-Question Round 🎯

Now we’ll do the final MySQL Indexing interview round. Since you prefer interview preparation with cross-questions, I’ll give you the question first, then the ideal answer + cross-questions.

1. What is an index in MySQL?

Answer:
An index is a data structure that helps MySQL find rows faster without scanning the entire table.

Cross-question: Why is it compared to a book index?
Answer: A book index helps us directly find a topic instead of reading every page. Similarly, a database index helps MySQL find required rows faster.

2. Does an index always improve query performance?

Answer:
No. An index can improve read performance, but it also requires storage and adds overhead to INSERT, UPDATE, and DELETE operations.

Cross-question: Why does writing become slower?
Answer: When data changes, MySQL may also need to update the related indexes.

3. Does MySQL always use an index if one exists?

Answer:
No. The MySQL optimizer decides whether using an index is beneficial based on factors such as table size, data distribution, available indexes, and query conditions.

Cross-question: How can you check whether an index is being used?

Answer: Using:

EXPLAIN SELECT * FROM employees
WHERE employee_name = 'Rahul';

We check the key column to see which index MySQL selected.

4. What is the difference between possible_keys and key?
Column	Meaning
possible_keys	Indexes MySQL considers potentially useful
key	Index MySQL actually chooses

Cross-question: If possible_keys is NULL, what does it mean?

Answer: MySQL did not identify a suitable index for the access conditions of that query.

5. What is a composite index?

Answer:
A composite index is an index created on multiple columns.

CREATE INDEX idx_dept_city
ON employees(department, city);

Here, department is the first column and city is the second.

6. What is the leftmost-prefix principle?

For:

(department, city, salary)

the index can generally support searches beginning with:

department
department + city
department + city + salary

But it does not provide the same direct leading-column benefit for:

city
salary

alone.

Cross-question: Does the order of columns in the WHERE clause have to match the index order?

Answer: No.

For example:

WHERE city = 'Bhopal'
AND department = 'IT'

can potentially use:

(department, city)

because both indexed columns are specified.

7. Does a primary key automatically have an index?

Answer:
Yes. MySQL automatically creates a unique index for the primary key.

Cross-question: Should we create another normal index on the same primary-key column?

Answer: Generally no, because it would be redundant.

8. Does a foreign key automatically have an index?

Answer:
In InnoDB, if a suitable index does not already exist, MySQL can automatically create one for the foreign-key columns.

Important: A foreign key and an index are not the same thing. The foreign key is a referential constraint; the index helps with efficient access and constraint checking.

9. What is a unique index?

Answer:
A unique index ensures that duplicate non-NULL values are not allowed in the indexed column(s).

CREATE UNIQUE INDEX idx_email
ON employees(email);

Cross-question: Can a MySQL unique index contain multiple NULL values?

Answer: Yes. MySQL allows multiple NULL values in a unique index because NULL is not considered equal to another NULL.

10. What is a prefix index?

Answer:
A prefix index indexes only the beginning portion of a string column.

CREATE INDEX idx_email_prefix
ON employees(email(10));

It can reduce index size for long string columns, but it may provide less selectivity than indexing the complete value.

11. What is EXPLAIN used for?

Answer:
EXPLAIN is used to understand how MySQL plans to execute a query.

It helps us inspect things such as:

access type
possible indexes
selected index
estimated rows
filtering
extra operations

Example:

EXPLAIN
SELECT *
FROM employees
WHERE salary = 60000;
12. What does type = ALL mean in EXPLAIN?

Answer:
ALL generally means MySQL is performing a full table scan.

It examines rows from the table rather than using an index for the access method.

Cross-question: Is ALL always bad?

Answer: No. For a very small table, scanning the whole table can actually be cheaper than using an index.

13. What does key = NULL mean?

Answer:
It means MySQL did not choose an index for that query.

Important: It does not necessarily mean that no indexes exist on the table.

14. What columns are common candidates for indexing?

Answer: Columns frequently used in:

WHERE
JOIN
ORDER BY
GROUP BY

But we should consider the actual workload, selectivity, table size, and existing indexes before creating one.

15. Why shouldn't we create indexes on every column?

Answer:
Because indexes:

consume storage,
increase write overhead,
can make INSERT, UPDATE, and DELETE more expensive,
can create redundant indexes,
require maintenance.
16. What is a redundant index?

Answer:
A redundant index is an index whose useful functionality is already sufficiently covered by another index, so keeping both may provide little additional benefit.

Example:

idx_dept(department)

and

idx_dept_city(department, city)

The second index can generally support queries beginning with department, so the first may be redundant depending on the workload.

17. How would you optimize a slow query using indexes?

Interview-ready answer:

First, I would identify the slow query and examine its WHERE, JOIN, ORDER BY, and GROUP BY conditions. Then I would check the existing indexes and use EXPLAIN to understand the execution plan. Based on the query pattern, I would consider an appropriate single-column or composite index, test the query again, and compare the performance. I would avoid creating unnecessary or redundant indexes.

🔥 Final Cross-Question

Imagine you have:

CREATE INDEX idx_dept_city
ON employees(department, city);

And the query is:

SELECT *
FROM employees
WHERE city = 'Bhopal';
Interviewer asks:

Will idx_dept_city be equally suitable for this query? Why or why not?

Think about the leftmost-prefix principle before answering.



“No, because the leftmost column in our index is department, but the query filters only on city. Since city is not the leftmost column, this composite index is not directly suitable for this query.” 