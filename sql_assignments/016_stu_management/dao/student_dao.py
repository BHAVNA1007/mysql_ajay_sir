from database.connection import Database
from model.student import Student

class StudentDao:

    def get_student_by_id(self,id):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()
        query = "select * from students where StudentID = %s"
        cursor.execute(query, (id,))

        row = cursor.fetchone()
        
        cursor.close
        conn.close()

        if row is not None:
            student = Student(row[0], row[1], row[2], row[3])
            return student

        return None    
        

         
    def get_all_students(self):
        print("getting all students data")
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = 'select * from students '
        cursor.execute(query)
        rows = cursor.fetchall()
        students = []

        for row in rows:
            
            student = Student(row[0], row[1], row[2], row[3])
            students.append(student)
            
        conn.close()
        return students    

    def getstudent(self):
        db = Database()
        db.connect()
        print("dao getting employee data")

    def save_student(self, student):
       print("dao saving student data")
       print("id", student.StudentID)
       print("Nmae", student.Name)
       print("age", student.Age)
       print("marks", student.Marks)

       db = Database()
       conn = db.connect()
       cursor = conn.cursor()

       query = 'insert into students (StudentID, Name, Age, Marks ) values (%s, %s, %s, %s)'  
       data = (student.StudentID, student.Name, student.Age, student.Marks)

       cursor.execute(query, data) 
       conn.commit()
       conn.close()

       print("data saved successfully") 

