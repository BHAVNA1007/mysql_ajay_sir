from database.connection import Database
from model.customer import Customer

class CustomerDao:
    def get_all_customers(self):
        print("dao getting all customers")
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = "select * from customer"

        cursor.execute(query)
        rows = cursor.fetchall()

        customers = []

        for row in rows:

            customer = Customer(row[0], row[1], row[2], row[3])
            customers.append(customer)

        conn.close()
        return customers

    def save_customer(self, customer):
        print("dao saving data")
        print("id", customer.id)
        print("name", customer.cname)
        print("dob", customer.cdob)
        print("caddresss", customer.caddresss)

        db = Database()
        conn = db.connect()
        cursor =conn.cursor()

        query = "insert into customer(id, cname, cdob, caddresss) values (%s, %s, %s, %s)"
        data = (customer.id, customer.cname, customer.cdob, customer.caddresss) 
        cursor.execute(query, data)
        conn.commit()

        print("data saved successfully")   