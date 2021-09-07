/*class Products {
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
}*/

class Products{
  String? id;
  String? name;
  String? image;
  String? parent;
  String? image2;

  Products.fromJsonShopify(Map<String, dynamic> parsedJson) {
    // printLog('fromJsonShopify id $parsedJson');

    if (parsedJson['slug'] == 'uncategorized') {
      return;
    }
    try {
      id = parsedJson['id'];
      name = parsedJson['title'];
      print(name);
      parent = '0';
      final imagee= parsedJson['image'];
      if (imagee != null) {
        this.image = imagee['transformedSrc'].toString();
        this.image2 = imagee['originalSrc'].toString();
      } else {
        this.image = 'no';
      }
      print(image);
      print(image2);
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }
  @override
  String toString() => 'Category { id: $id  name: $name}';


}
