// /*class Products {
//   String producttitle;
//   String productimage;

//   Products();

//   Products.fromJSon(Map<String, dynamic> parsedJson) {
//     title = parsedJson['title'];
//     onlineStoreUrl = parsedJson['onlineStoreUrl'];
//   }

//   Products.fromShopify(Map<String, dynamic> json) {
//     try {
//       title = json['title'];
//       onlineStoreUrl = json['onlineStoreUrl'];
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }*/

// class Collections {
//   String? id;
//   String? name;
//   String? images;
//   String? parent;
//   String? image2;
//   String? at;
//   List? img;

//   Collections.fromJsonShopify(Map<String, dynamic> parsedJson) {
//     // printLog('fromJsonShopify id $parsedJson');

//     if (parsedJson['slug'] == 'uncategorized') {
//       return;
//     }
//     try {
//       id = parsedJson['id'];
//       name = parsedJson['title'];
//       at = parsedJson['updatedAt'];
//       img = parsedJson['images'];
//       print(name);
//       parent = '0';
//       final imagee = parsedJson['images'];
//       if (imagee != null) {
//         this.images = imagee['originalSrc'];
//         // this.image2 = imagee['id'].toString();
//         // this.at = imagee['updatedAt'].toString();
//         // this.img = imagee['images'];
//       } else {
//         this.images = 'no';
//       }
//       print(images);
//       // print(image2);
//     } catch (e, trace) {
//       print(e.toString());
//       print(trace.toString());
//     }
//   }
//   @override
//   String toString() => 'Category { id: $id  name: $name originalSrc: $images}';
// }


// // class Products {
// //   String? id;
// //   String? name;
// //   String? image;
// //   String? parent;
// //   String? image2;

// //   Products.fromJsonShopify(Map<String, dynamic> parsedJson) {
// //     // printLog('fromJsonShopify id $parsedJson');

// //     if (parsedJson['slug'] == 'uncategorized') {
// //       return;
// //     }
// //     try {
// //       id = parsedJson['description'];
// //       name = parsedJson['title'];
// //       print(name);
// //       parent = '0';
// //       final imagee = parsedJson['images'];
// //       if (imagee != null) {
// //         this.image = imagee['transformedSrc'].toString();
// //         this.image2 = imagee['transformedSrc'].toString();
// //       } else {
// //         this.image = 'no';
// //       }
// //       print(image);
// //       print(image2);
// //     } catch (e, trace) {
// //       print(e.toString());
// //       print(trace.toString());
// //     }
// //   }
// //   @override
// //   String toString() => 'Category { id: $id  name: $name}';
// // }
