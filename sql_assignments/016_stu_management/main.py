from service.student_service import StudentService

from model.student import Student

print("welcome to our website")
service = StudentService()

students = service.get_all_students()
for student in students:
    print("id", student.StudentID)
    print("name", student.Name)
    print("salary", student.Age)
    print("marks", student.Marks)
    print()
'''
welcome to our website
dao getting all student data
getting all students data
database connection created
id 101
name Alice
salary 20
marks 85.50

id 102
name priya
salary 21
marks 88.00

id 104
name David
salary 24
marks 75.00


'''    





#student = Student(102, 'priya', 21, 88)
#service.add_student(student)
'''
welcome to our website
service adding student
dao saving student data
id 102
Nmae priya
age 21
marks 88
database connection created
data saved successfully

'''




'''
mysql> use batch18
Database changed
mysql> select * from students;
+-----------+-------+------+-------+
| StudentID | Name  | Age  | Marks |
+-----------+-------+------+-------+
|       101 | Alice |   20 | 85.50 |
|       102 | priya |   21 | 88.00 |
|       104 | David |   24 | 75.00 |
+-----------+-------+------+-------+
3 rows in set (0.00 sec)

'''