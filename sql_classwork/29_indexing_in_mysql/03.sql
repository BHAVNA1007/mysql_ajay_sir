How to Decide Which Column Needs an Index ⭐⭐⭐

This is one of the most important real-world indexing questions.

“I look at the applications frequently executed queries, especially columns used in WHERE, JOIN, ORDER BY, and GROUP BY. I also consider selectivity, table size, write frequency, existing indexes, and then use EXPLAIN to verify whether the index actually improves the execution plan.”



Advantages and Disadvantages of Indexes:
=========================================

Advantages
===========

Faster data retrieval

WHERE email = 'amit@gmail.com'

Can help with:

WHERE
JOIN
ORDER BY
GROUP BY

Can enforce uniqueness with a UNIQUE index.



Disadvantages:
===============
Consumes storage

INSERT can become slower

MySQL has to update the relevant indexes when inserting a row.

UPDATE can become slower

Especially when an indexed column changes.

DELETE can become slower

Index entries also need to be removed.

Too many indexes can be harmful

They increase storage and maintenance overhead and can give the optimizer more choices to evaluate.

⭐ Interview question

Q: If indexes make queries faster, why dont we create indexes on every column?

Answer:

“Because indexes consume storage and add overhead to INSERT, UPDATE, and DELETE operations. Therefore, we should create indexes based on actual query patterns and verify their usefulness with execution plans.”