import mysql.connector  
print("Import done")

conn = mysql.connector.connect(host="localhost",port=3306,user="root",password="Bhavna@123",database="batch18") # Connection establish

if conn.is_connected():
    print("connected to database successfully")

cursor = conn.cursor() 

while True:
    print("\n***********MENU************\n")
    print("===== PRODUCT INVENTORY SYSTEM =====")
    print('1. Add Product')
    print('2. Display All Products')
    print('3. Search Product by Name')
    print('4. Update Product Price')
    print('5. Delete Product')
    print('6. Exit')
    choice = int(input("ENTER CHOICE:  ")) 

    match choice:

        case 1:

            print('1. Add  Product')
            pid = int(input('ENTER  Product ID : '))
            pname = input("ENTER  Product NAME : ")
            category = input("ENTER  category: ")
            price = float(input("ENTER Price : "))
            quantity = input("ENTER quantity : ")
            query = "insert into product_pdbc(pid, pname, category, price, quantity) values(%s, %s, %s, %s, %s)"
            cursor.execute(query, (pid, pname, category, price, quantity))     
            conn.commit()
            print("data inserted")

        case 2:
            print('2. Display All products')
            query = "select * from product_pdbc"
            cursor.execute(query )
            rows = cursor.fetchall()
            print('------------------------------------')
            print("pid  pname  category  price  quantity")
            print('------------------------------------')
            for row in rows:
                print(f"{row[0]}    {row[1]}    {row[2]}    {row[3]}    {row[4]}")

        case 3:
            print('3. Search Product by Name')
            pname = input("enter Product name: ")
            query = "select * from product_pdbc where pname like %s"
            cursor.execute(query, ("%"+ pname + "%",))
            rows = cursor.fetchall()

            if not rows:
                 print("not found")
            else:

                print('------------------------------------')
                print("pid  pname  category  price  quantity")
                print('------------------------------------')
 
                for row in rows:
                           
                    print(f"{row[0]}    {row[1]}    {row[2]}    {row[3]}    {row[4]}")


        case 4:

            print('4. Update Product price')   
            pid = int(input("ENTER P_ID: "))
            price  = float(input("ENTER NEW PRICE: "))
            query = "update product_pdbc set price = %s where pid = %s"
            cursor.execute(query, (price, pid))

            conn.commit()
            print("Product price updated successfully.")


        case 5:
            print('5. Delete product')
            pid = int(input("ENTER P_ID: "))
            query = "delete from product_pdbc where pid = %s"
            cursor.execute(query, (pid, ))
            conn.commit()

            print("Product deleted successfully.")

        case 7:
            print("7. Display all products from Electronics category.")
            category = input("Enter category:  ")
            query = "select * from product_pdbc where category = %s"
            cursor.execute(query, (category, ))

            rows = cursor.fetchall()

            

            print("all products from Electronics category.")
            print('------------------------------------')
            print("pid    pname    category    price    quantity")
            print('------------------------------------')

            for row in rows:
                print(f"{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}") 

        case 7:
            print("7. Display all products from Electronics category.")
            category = input("Enter category:  ")
            query = "select * from product_pdbc where category = %s"
            cursor.execute(query, (category, ))

            rows = cursor.fetchall()

            

            print("all products from Electronics category.")
            if not rows:
                print("not found")
            else:    
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')
    
                for row in rows:
                    print(f"{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}") 

        case 8:
            print("8. Display all products from Stationery category.")
            category = input("Enter category:  ")
            query = "select * from product_pdbc where category = %s"
            cursor.execute(query, (category, ))

            rows = cursor.fetchall()

           

            print("all products from Stationery category.")
            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 


        case 9:
            print("Search products whose names contain 'oo'.")
            pname = input("Enter name like:  ")
            query = "select * from product_pdbc where pname like %s"
           
            cursor.execute(query, ("%"+ pname + "%",))

            rows = cursor.fetchall()

            

            print("all products pname like 'oo'.")

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 

        case 10:
            print("Search products whose names start with 'M'.")
            pname = input("Enter name like:  ")
            query = "select * from product_pdbc where pname like %s"
           
            
            cursor.execute(query, (pname + "%",))

            rows = cursor.fetchall()

            print("all products pname like 'm'.")

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 

        case 11:
            print("Search products whose names end with 'e'.")
            pname = input("Enter name like:  ")
            query = "select * from product_pdbc where pname like %s"
           
            cursor.execute(query, ("%" + pname,))

            rows = cursor.fetchall()

            

            print("all products pname like 'e'.")

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 

    
        case 12:
            print("Display products whose price is greater than 1000.")
            price = float(input("Enter price:  "))
            query = "select * from product_pdbc where price > %s"
           
            cursor.execute(query, (price,))

            rows = cursor.fetchall()

            

            print("all products where price is greater then 1000.")

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 

        case 13:
            print("Display products whose quantity is less than 20.")
            quantity = float(input("Enter quantity:  "))
            query = "select * from product_pdbc where quantity < %s"
           
            cursor.execute(query, (quantity,))

            rows = cursor.fetchall()

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 

        case 14:

            print('14 Update product quantity.')   
            pid = int(input("ENTER P_ID: "))
            quantity  = float(input("ENTER NEW quantity: "))
            query = "update product_pdbc set quantity = %s where pid = %s"
            cursor.execute(query, (quantity, pid))

            conn.commit()
            print("Product quantity updated successfully.")

        case 15:

            print('15 Update product category.')   
            pid = int(input("ENTER P_ID: "))
            category  = input("ENTER NEW category: ")
            query = "update product_pdbc set category = %s where pid = %s"
            cursor.execute(query, (category, pid))

            conn.commit()
            print("Product category updated successfully.")
              
        case 16:
            print('16. Delete a product by ID')
            pid = int(input("ENTER P_ID: "))
            query = "delete from product_pdbc where pid = %s"
            cursor.execute(query, (pid, ))
            conn.commit()

            print("Product deleted successfully.")
 
        case 17:
            print("Display products whose category contains 'tron'..")
            category = input("Enter category like:  ")
            query = "select * from product_pdbc where category like %s"
           
            cursor.execute(query, ("%"+ category + "%",))

            rows = cursor.fetchall()

            

            print("all products category like 'tron'.")

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 


        case 18:
            print("Display products where prise between 100 and 2000.")
            
            query = "select * from product_pdbc where price between 100 and 2000"
           
            cursor.execute(query,)

            rows = cursor.fetchall()

            

            print("all products where price between 100 and 2000.")

            if not rows:
                print("record not found")
            else:
                print('------------------------------------')
                print("pid    pname    category    price    quantity")
                print('------------------------------------')

                for row in rows:
                    print(f"\n{row[0]}    {row[1]}   {row[2]}   {row[3]}    {row[4]}\n") 


        case 6:

            print('Thank you for using Product Inventory System.')   
            break

        case _:
            print("Invalid choice. Please try again")

           
            
conn.close()
print("Connection closed successfully.")

  