class Products {
  String producttitle;
  String productimage;

  Products({ required this.producttitle,required this.productimage});

}
class ProductsList {
   List<Products> _items = [];

  void addProduct(Products product) {
    //if (_items.length != 0) {
      try {
        final newProduct = Products(producttitle: product.producttitle, productimage: product.productimage );
        _items.add(newProduct);
        //print(_items[0].title);
      } catch (error) {
        throw error;
      }
    }
  //}
  List<Products> get items {
    return  [..._items];//copy
  }



}
