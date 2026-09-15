SQL Interview Q&A — TCL, Primary Key, Foreign Key, GROUP BY


1. TCL

Q1. What is TCL?

Answer:
TCL stands for 

Transaction Control Language. It is used to manage transactions in a database.

The main TCL commands are:

COMMIT
ROLLBACK
SAVEPOINT



Cross-question: What is a transaction?

Answer:
A transaction is a sequence of SQL operations treated as a single logical unit of work.

Q2. What is the difference between COMMIT and ROLLBACK?

Answer:
COMMIT permanently saves the changes made by a transaction, while ROLLBACK undoes uncommitted changes.

Cross-question: Can we rollback after COMMIT?

Answer:
Normally, no. Once changes are committed, a normal ROLLBACK cannot undo them.

Q3. What is SAVEPOINT?

Answer:
A SAVEPOINT creates a point inside a transaction to which we can partially roll back.

SAVEPOINT sp1;
ROLLBACK TO sp1;

Cross-question: Does ROLLBACK TO SAVEPOINT end the entire transaction?

Answer:
No. It only undoes changes made after that savepoint. The transaction can continue.

Q4. What is the difference between DELETE, TRUNCATE and ROLLBACK?

Answer:

DELETE	            TRUNCATE	               ROLLBACK
Removes rows     	Removes all rows	       Undoes transaction changes
DML                	DDL	                       TCL
Can use WHERE	    Cannot use WHERE	       Used with transactions

Cross-question: Can DELETE be rolled back in MySQL?

Answer:
Yes, when executed inside a transaction using a transactional storage engine such as InnoDB, provided it has not been committed.

2. PRIMARY KEY

Q5. What is a Primary Key?

Answer:
A primary key is a column or combination of columns that uniquely identifies each row in a table.

Cross-question: Can a primary key contain NULL?

Answer:
No. A primary key cannot contain NULL.

Q6. Can a table have more than one primary key?

Answer:
No. A table can have only one primary key constraint.

Cross-question: Can that primary key contain multiple columns?

Answer:
Yes. This is called a composite primary key.

PRIMARY KEY (student_id, subject_id)
Q7. Can a primary key contain duplicate values?

Answer:
No. Primary-key values must be unique.

Cross-question: Can a foreign key contain duplicate values?

Answer:
Yes. Multiple child records can reference the same parent record.

Q8. What is the difference between PRIMARY KEY and UNIQUE KEY?

Answer:

PRIMARY KEY	UNIQUE KEY
Uniquely identifies a row	Ensures uniqueness
Cannot contain NULL	NULL handling differs by DBMS
One primary-key constraint per table	Multiple UNIQUE constraints can exist
Usually used as the main identifier	Used for additional unique attributes

Cross-question: Can a table have multiple UNIQUE keys?

Answer:
Yes.

Q9. Is a Primary Key a Candidate Key?

Answer:
Yes. A primary key is one of the candidate keys selected to uniquely identify rows.

Cross-question: Is every candidate key a primary key?

Answer:
No. A table can have multiple candidate keys, but only one is selected as the primary key.

Q10. Is a Primary Key a Super Key?

Answer:
Yes.

A primary key is a candidate key, and a candidate key is a minimal super key.

So:

Primary Key → Candidate Key → Super Key

3. FOREIGN KEY

Q11. What is a Foreign Key?

Answer:
A foreign key is a column or combination of columns that references a key in another table and helps maintain referential integrity.

Cross-question: Which table is called the parent table?

Answer:
The table containing the referenced key is the parent table.

The table containing the foreign key is the child table.

Q12. Can a foreign key contain NULL?

Answer:
Yes, unless the foreign-key column is defined as NOT NULL.

Cross-question: Can a foreign key contain duplicate values?

Answer:
Yes.

For example, many employees can belong to the same department.

Q13. Can a foreign key reference a column other than the primary key?

Answer:
Yes, depending on the database rules, it can reference a suitable UNIQUE key as well.

Cross-question: Why can't we reference just any normal column?

Answer:
Because the referenced values need to provide a valid unique reference according to the database's foreign-key rules.

Q14. What is referential integrity?

Answer:
Referential integrity ensures that a foreign-key value refers to a valid record in the referenced table, according to the defined constraints.

Cross-question: What happens if we insert an invalid foreign-key value?

Answer:
The database rejects the operation because it violates the foreign-key constraint.

Q15. What is ON DELETE CASCADE?

Answer:
ON DELETE CASCADE automatically deletes related child records when the referenced parent record is deleted.

Example:

FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE CASCADE

Cross-question: What is the risk of CASCADE?

Answer:
Deleting one parent record can automatically delete many related child records, so it should be used carefully.

Q16. What is ON DELETE SET NULL?

Answer:
When the parent record is deleted, the foreign-key value in the child record is set to NULL.

Cross-question: What condition is required?

Answer:
The foreign-key column must allow NULL.

4. GROUP BY



Q17. What is GROUP BY?

Answer:
GROUP BY groups rows having the same values so that aggregate calculations can be performed for each group.

Example:

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

Cross-question: Why do we use COUNT() with GROUP BY?

Answer:
To calculate the number of rows in each group.

Q18. What is the difference between WHERE and HAVING?

Answer:

WHERE filters rows before grouping, while HAVING filters groups after grouping.

Example:

SELECT department_id, AVG(salary)
FROM employees
WHERE salary > 30000
GROUP BY department_id
HAVING AVG(salary) > 50000;

Cross-question: Can we use aggregate functions in WHERE?

Answer:
Generally, no. Aggregate conditions are handled using HAVING.

Q19. Can we use GROUP BY without an aggregate function?

Answer:
Yes.

SELECT department_id
FROM employees
GROUP BY department_id;

Cross-question: How is this different from DISTINCT?

Answer:
Both can produce unique groups/values in simple cases, but GROUP BY is primarily designed for grouping and aggregation, while DISTINCT is used to remove duplicate result rows.

Q20. What happens if we select a column that is neither in GROUP BY nor aggregated?

Answer:
In standard SQL, that is invalid because the database cannot determine which value from the group should be returned.

Example:

SELECT department_id, employee_name, COUNT(*)
FROM employees
GROUP BY department_id;

employee_name is neither grouped nor aggregated.

Cross-question: What should we do?

Answer:
Either include employee_name in GROUP BY or apply an appropriate aggregate function to it, depending on the requirement.



🔥 Most Important Cross-Questions

Q21. Can a foreign key be a primary key?

Answer:
Yes.

This is possible when the same column acts as both the primary key of the child table and a foreign key referencing another table.

This design is commonly seen in one-to-one relationships.

Q22. Can a primary key be a foreign key?

Answer:
Yes. A column can simultaneously be a Primary Key and Foreign Key.

Q23. Can one table have multiple foreign keys?

Answer:
Yes.

For example:

orders
------
customer_id → customers
product_id  → products

So one table can reference multiple tables.

Q24. Can two tables have foreign keys referencing each other?

Answer:
Yes, databases can support relationships where tables reference each other, although such designs require careful handling of inserts, deletes, and constraints.

Q25. Which is more restrictive: Primary Key or Foreign Key?

Answer:
They enforce different rules.

Primary Key: uniqueness + non-NULL identification.
Foreign Key: valid relationship/reference to another table.

So we shouldn't simply say one is "more restrictive"; they solve different problems.

Q26. What is the most common mistake beginners make with GROUP BY?

Answer:
Trying to filter aggregate results using WHERE.

Incorrect concept:

WHERE COUNT(*) > 5

Correct:

HAVING COUNT(*) > 5
Q27. What is the difference between GROUP BY and ORDER BY?

Answer:

GROUP BY groups rows.
ORDER BY sorts the result.

They can also be used together.

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY COUNT(*) DESC;

Cross-question: Which one should logically happen first?

Answer:
Conceptually, grouping happens before the final ordering of the result.

Q28. Give a real-world example combining Primary Key and Foreign Key.

Answer:

Department
-----------
department_id  PK
department_name

Employee
--------
employee_id     PK
employee_name
department_id   FK

department_id uniquely identifies a department in Department and connects employees to their department in Employee.

Cross-question: Why don't we store department_name repeatedly in Employee?

Answer:
Because storing the department ID and referencing the department table reduces unnecessary duplication and supports normalization and data consistency.
