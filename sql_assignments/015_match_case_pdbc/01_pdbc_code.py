import mysql.connector

print("connection import done")

conn = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    port = 3306,
    password = 'Bhavna@123',
    database = 'pdbc_practice'
)

if conn.is_connected:
    print("connection successfully done")

cursor = conn.cursor()

while True:

    print("\n*******************MENU**********************\n")
    print("===== ONLINE SHOPPING ORDER MANAGEMENT =====")
    print("1. Add Customer")
    print("2. Add Product")
    print("3. Place Order")
    print("4. Display All Orders with Customer and Product Details")
    print("5. Search Customer by Name")
    print("6. Update Product Price")
    print("7. Update Order Status")
    print("8. Delete Order")
    print("9. Display Customer-wise Total Purchase Amount")
    print("10. Display Products Costing More Than Average Product Price")
    print("11. Display Customers Who Have Placed at Least One Order")
    print("12. Display Customers Who Have Not Placed Any Order")
    print("13. Exit")

    choice = int(input("Enter your choice: "))

    match choice:
        case 1:
            print("1. Add Customer")
            id = int(input("Enter customer id: "))
            name = input("Enter customer name: ")
            city = input("Enter customer city: ")
            email = input("Enter customer email: ")

            query = 'insert into customer_order_pdbc values(%s, %s, %s, %s)'
            cursor.execute(query, (id, name, city, email))
            conn.commit()
            print("customer added successfully")

        case 2:
            print("2. Add Product")
            id = int(input("Enter product id: "))
            name = input("Enter product name: ")
            category = input("enter product category: ")
            price = float(input("Enter product price: "))
            stock = int(input("Enter product stock: "))

            query = 'insert into product_order_pdbc values(%s, %s, %s, %s, %s )'
            cursor.execute(query, (id, name, category, price, stock))
            conn.commit()
            print("product added successfully")

        case 3:
            print("3. Place Order")
            oid = int(input('Enter order id: '))
            cid = int(input('Enter customer id: '))
            pid = int(input('Enter product id: '))
            quantity = int(input('Enter order quantity: '))
            order_status = input('Enter order status: ')

            query = 'insert into customer_order_details values(%s, %s, %s, %s, %s)'
            cursor.execute(query, (oid, cid, pid, quantity, order_status))
            conn.commit()
            print("Order placed successfully.")

        case 4:
            print("4. Display All Orders with Customer and Product Details")
            query = 'select o.order_id,' \
            'c.customer_name,' \
            'p.product_name,' \
            'o.quantity,' \
            'p.price,' \
            'o.quantity * p.price AS amount,' \
            'o.order_status' \
            ' from customer_order_details as o ' \
            'INNER JOIN customer_order_pdbc as c ON o.customer_id = c.customer_id ' \
            'INNER JOIN product_order_pdbc as p ON  o.product_id = p.product_id ';  

            cursor.execute(query) 
            rows = cursor.fetchall() 
            print("-" * 100)
            print(f"{'Order_ID':<10} | {'Customer_Name':<15} | {'Product_Name':<15} | {'Quantity':<8} | {'Price':<10} | {'Amount':<10} | {'Status':<10}")
            print("-" * 100)
            
            for row in rows:
                print(f"{row[0]:<10} | {row[1]:<15} | {row[2]:<15} | {row[3]:<8} | {row[4]:<10.2f} | {row[5]:<10.2f} | {row[6]:<10}")
            
            print("-" * 100)

        case 5:
            print("5. Search Customer by Name")
            customer_name = input("Enter customer name to search: ") 
            query = 'select * from customer_order_pdbc where customer_name like %s'
            cursor.execute(query, ("%" +  customer_name + "%",))
            rows = cursor.fetchall()
            print("-"*50)
            print(f"{'Customer ID':<15} | {'Customer Name':<15} | {'City':<10}")
            print("-"*50)
            for row in rows:
                print(f"{row[0]:<15} | {row[1]:<15} | {row[2]:<10}")
            print("-"*50)  

        case 6:
            print("6. Update Product Price")   
            pid = int(input("Enter Product ID: "))
            price = float(input("Enter New Price: "))  

            query = 'update product_order_pdbc set price = %s where product_id = %s'
            cursor.execute(query, (price, pid))

            conn.commit()

        case 7:
            print("7. Update Order Status")    
            oid = int(input("Enter Order ID: "))
            status = input("Enter New Status: ")

            query = 'update customer_order_details set order_status = %s where order_id = %s'
            cursor.execute(query, (status, oid))
            conn.commit()
            print("Order status updated successfully")

        case 8:
            print("8. Delete Order")
            oid = int(input("Enter Order ID: "))
            query = 'delete from customer_order_details where order_id = %s'
            cursor.execute(query, (oid,))
            conn.commit()
            print("Order deleted successfully.")   

        case 9:    
            print("9. Display Customer-wise Total Purchase Amount")  

            query = 'SELECT c.customer_id, c.customer_name, SUM(d.quantity * p.price) AS amount ' \
                   'FROM customer_order_pdbc AS c ' \
                   'INNER JOIN customer_order_details AS d ' \
                   'ON c.customer_id = d.customer_id ' \
                   'INNER JOIN product_order_pdbc AS p ' \
                   'ON d.product_id = p.product_id ' \
                   'GROUP BY c.customer_id, c.customer_name ' \
                   'ORDER BY c.customer_id'    
                 
            cursor.execute(query)
            rows = cursor.fetchall()
            print("-"*50)
            print(f"{'Customer ID':<15} | {'Customer Name':<15} | {'amount':<10}")
            print("-"*50)
            for row in rows:
                print(f"{row[0]:<15} | {row[1]:<15} | {row[2]:<10}")
            print("-"*50)  

        case 10:
            print("10. Display Products Costing More Than Average Product Price")
            query = 'select * from product_order_pdbc where price >' \
            '(select avg(price) From product_order_pdbc)'

            cursor.execute(query)
            rows = cursor.fetchall()
            print("-"*50)
            print(f"{'Product ID':<15} | {'Product Name':<15} | {'Price':<10}")
            print("-"*50)
            for row in rows:
                print(f"{row[0]:<15} | {row[1]:<15} | {row[3]:<10}")
            print("-"*50)  

        case 11:
            print("11. Display Customers Who Have Placed at Least One Order")
            query = 'SELECT customer_id, customer_name ' \
               'FROM customer_order_pdbc ' \
               'WHERE customer_id IN ' \
               '(SELECT customer_id FROM customer_order_details)'
          
            cursor.execute(query)
            rows = cursor.fetchall()
            print("-"*50)
            print(f"{'Customer ID':<15} | {'Customer Name':<15} ")
            print("-"*50)
            for row in rows:
                print(f"{row[0]:<15} | {row[1]:<15} ")
            print("-"*50)  

        case 12:
            print("12. Display Customers Who Have Not Placed Any Order")
            query = "SELECT c.customer_id, c.customer_name " \
                    "FROM customer_order_pdbc AS c " \
                    "WHERE NOT EXISTS (" \
                    "SELECT 1 FROM customer_order_details AS d " \
                    "WHERE d.customer_id = c.customer_id)"

            cursor.execute(query)
            rows = cursor.fetchall()
            print("-"*50)
            print(f"{'Customer ID':<15} | {'Customer Name':<15} ")
            print("-"*50)
            for row in rows:
                print(f"{row[0]:<15} | {row[1]:<15} ")
            print("-"*50)  

        case 13:
            print("13. Exit")
            break

        case _:
            print("please enter valid choice")    

conn.close()
print("connection closed successfully")

