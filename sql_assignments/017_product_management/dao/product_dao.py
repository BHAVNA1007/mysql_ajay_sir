from database.connection import Database


class ProductDao:
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