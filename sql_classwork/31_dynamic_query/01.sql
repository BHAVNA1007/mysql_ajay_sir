PROBLEM :SQL INJECTION: Is a security vulnerability where a user can manupilate the sql query by intering malicious input

select * from tablename where uername = '' or '1' = '1'

the above condition is always true it means all recordss from the table are return


DYNAMIC QUERY WITH WHERE CLAUSE:
=================================

WAQ : TO READ NAME AND SALARY FROM USER AND FETCH THAT RECORD.




DYNAMIC INSERT:
===============



WAQ TO UPDATE SALARY OF AN EMPLOYEE BASED ON id




WAQ TO DELETE ANY EMPLOYEE BASED ON ID




DYNAMIC QUERY WITH LIKE:
========================





DYNAMIC QUERY WITH IN OPERATOR:
================================

ids = [101, 102, 105]
query = "select * from pdemployee1 where id in(%s, %s, %s)"

cursor.execute(query, tuple(ids))
for row in cursor.fetchall():
     print(row)
 print("finding in ids")
 conn.close()



 HOMEWORK
 ========

 PERFORM GROUP BY, HAVING, ORDER BY, LIMIT, OFFSET, FOREIGN KEY, JOINS, AND SUBQUERIES.


