<<<<<<< Updated upstream
class Products {
  String? title;
  String? onlineStoreUrl;
=======
/*class Products {
  String producttitle;
  String productimage;
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
}

// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

=======
}*/

class Collections {
  String? id;
  String? name;
  String? image;
  String? parent;
  String? image2;

  Collections.fromJsonShopify(Map<String, dynamic> parsedJson) {
    // printLog('fromJsonShopify id $parsedJson');

    if (parsedJson['slug'] == 'uncategorized') {
      return;
    }
    try {
      id = parsedJson['description'];
      name = parsedJson['title'];
      print(name);
      parent = '0';
      final imagee = parsedJson['image'];
      if (imagee != null) {
        this.image = imagee['transformedSrc'].toString();
        this.image2 = imagee['transformedSrc'].toString();
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

// class Products {
//   String? id;
//   String? name;
//   String? image;
//   String? parent;
//   String? image2;

//   Products.fromJsonShopify(Map<String, dynamic> parsedJson) {
//     // printLog('fromJsonShopify id $parsedJson');

//     if (parsedJson['slug'] == 'uncategorized') {
//       return;
//     }
//     try {
//       id = parsedJson['description'];
//       name = parsedJson['title'];
//       print(name);
//       parent = '0';
//       final imagee = parsedJson['images'];
//       if (imagee != null) {
//         this.image = imagee['transformedSrc'].toString();
//         this.image2 = imagee['transformedSrc'].toString();
//       } else {
//         this.image = 'no';
//       }
//       print(image);
//       print(image2);
//     } catch (e, trace) {
//       print(e.toString());
//       print(trace.toString());
//     }
//   }
//   @override
//   String toString() => 'Category { id: $id  name: $name}';
// }
>>>>>>> Stashed changes
