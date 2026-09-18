import mysql.connector

class Database:
    def connect(self):
        connection = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = 'Bhavna@123',
            port = 3306,
            database ='batch18',
        )
        print("database connection created")
        return connection