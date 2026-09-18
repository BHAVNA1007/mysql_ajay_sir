from dao.product_dao import ProductDao

class ProductService:

    def displayproduct(self):
        print("proccessing Product reqeust")
        dao = ProductDao()
        dao.getproduct()

    def add_product(self, product):
        print("service adding product")
        dao = ProductDao()   
        dao.save_product(product) 