import mysql.connector

class Database:
    def connect(self):
        connection = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            port = 3306,
            password = 'Bhavna@123',
            database = 'batch18'
        )
        print("connection stablished")
        return connection

