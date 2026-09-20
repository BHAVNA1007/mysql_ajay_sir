from database.connection import Database
from model.product import Product 


class ProductDao:

    def get_all_products(self):
        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query = 'select * from product'
        cursor.execute(query)

        rows = cursor.fetchall()
        product_list = []
        for row in rows:
            products = Product(row[0], row[1],  row[2],  row[3])
            product_list.append(products)
        conn.close()
        return product_list    

    def getproduct(self):
        db = Database()
        db.connect()
        print("dao getting product data")

    def save_product(self, product): 
        print("dao saving product data")
        print("id", product.pid)
        print("Name", product.pname)
        print("pcatogory", product.pcatogory) 
        print("price", product.price) 

        db = Database()
        conn = db.connect()
        cursor = conn.cursor()

        query ="insert into product (pid, pname, pcatogory, price) values (%s, %s, %s, %s)" 
        data = (product.pid, product.pname, product.pcatogory, product.price)

        cursor.execute(query, data)
        conn.commit()
        conn.close()

        print("data saved successfully")