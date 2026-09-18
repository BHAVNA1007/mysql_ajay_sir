from database.connection import Database

class StudentDao:
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

