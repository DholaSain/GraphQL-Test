class Products {
  String? title;
  String? onlineStoreUrl;

  Products();

  Products.fromJSon(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
    onlineStoreUrl = parsedJson['onlineStoreUrl'];
  }

  Products.fromShopify(Map<String, dynamic> json) {
    try {
      title = json['title'];
      onlineStoreUrl = json['onlineStoreUrl'];
    } catch (e) {
      print(e.toString());
    }
  }
}

// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

