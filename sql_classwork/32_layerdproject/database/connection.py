import mysql.connector

class Database:
    def connect(self):
       connection = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18")  

       print("database connection created")   
       return connection 