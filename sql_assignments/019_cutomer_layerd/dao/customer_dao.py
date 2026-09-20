from database.connection import Database
from model.customer import Customer


class CustomerDao:

    def delete_customer_by_id(self, id):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = "delete from customer where id = %s"
        cursor.execute(query, (id, ))

        deleted_count = cursor.rowcount
        conn.commit()
        cursor.close()

        if deleted_count > 0:
            print("customer deleted")
        else:
            print("customer not found")

        conn.close()    
        return deleted_count        

    def update_customer_by_id(self, id, name):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = "update customer set cname = %s  where id = %s"
        cursor.execute(query, (name, id))
        
        update_count = cursor.rowcount
        conn.commit()
        cursor.close()

        if update_count > 0:
            print("customer updated")
        else:
            print("customer not found")

        conn.close()    
        return update_count        

    def get_cutomer_by_id(self, id):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = "select * from customer where id = %s"
        cursor.execute(query, (id,))
        row = cursor.fetchone()
        cursor.close()
        conn.close() 
        
        if row is not None:
            customer = Customer(row[0], row[1], row[2], row[3])
            return customer
        

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
        cursor = conn.cursor()


        query = "insert into customer(id, cname, cdob, caddresss) values (%s, %s, %s, %s)"
        data = (customer.id, customer.cname, customer.cdob, customer.caddresss) 
        cursor.execute(query, data)
        conn.commit()

        print("data saved successfully")   