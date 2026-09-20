import mysql.connector

class Database:
    def connect(self):
        print("database connection stablish")
        conn = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            port = 3306,
            password = 'Bhavna@123',
            database = 'pdbc_practice'
        )
        print("database connection stablish")
        return conn
        