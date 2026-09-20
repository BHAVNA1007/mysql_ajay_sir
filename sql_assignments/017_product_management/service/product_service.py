from dao.product_dao import ProductDao

class ProductService:

    def update_product_by_id(self, id, name):
        print("dao logic product update by id")
        dao = ProductDao()
        product = dao.update_product_by_id(id, name)
        return product

    def get_product_by_id(self, id):
        print("dao getting product by id logic")
        dao = ProductDao()
        product = dao.get_product_by_id(id)
        return product

    def get_all_products(self):
        print("dao getting all products logic")
        dao = ProductDao()
        product_list = dao.get_all_products()
        return product_list

    def displayproduct(self):
        print("proccessing Product reqeust")
        dao = ProductDao()
        dao.getproduct()

    def add_product(self, product):
        print("service adding product")
        dao = ProductDao()   
        dao.save_product(product) 