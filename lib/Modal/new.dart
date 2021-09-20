// class ProductModel {
//   ProductModel({
//     required this.data,
//   });
//   late final Data data;

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.collections,
//   });
//   late final Collections collections;

//   Data.fromJson(Map<String, dynamic> json) {
//     collections = Collections.fromJson(json['collections']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['collections'] = collections.toJson();
//     return _data;
//   }
// }

// class Collections {
//   Collections({
//     required this.edges,
//   });
//   late final List<Edges> edges;

//   Collections.fromJson(Map<String, dynamic> json) {
//     edges = List.from(json['edges']).map((e) => Edges.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['edges'] = edges.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Edges {
//   Edges({
//     required this.node,
//   });
//   late final Node node;

//   Edges.fromJson(Map<String, dynamic> json) {
//     node = Node.fromJson(json['node']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['node'] = node.toJson();
//     return _data;
//   }
// }

// class Node {
//   Node({
//     required this.description,
//     required this.title,
//     required this.image,
//     required this.products,
//   });
//   late final String description;
//   late final String title;
//   late final Image image;
//   late final Products products;

//   Node.fromJson(Map<String, dynamic> json) {
//     description = json['description'];
//     title = json['title'];
//     image = Image.fromJson(json['image']);
//     products = Products.fromJson(json['products']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['description'] = description;
//     _data['title'] = title;
//     _data['image'] = image.toJson();
//     _data['products'] = products.toJson();
//     return _data;
//   }
// }

// class Image {
//   Image({
//     required this.transformedSrc,
//   });
//   late final String transformedSrc;

//   Image.fromJson(Map<String, dynamic> json) {
//     transformedSrc = json['transformedSrc'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['transformedSrc'] = transformedSrc;
//     return _data;s
//   }
// }

// class Products {
//   Products({
//     required this.edges,
//   });
//   late final List<Edges> edges;

//   Products.fromJson(Map<String, dynamic> json) {
//     edges = List.from(json['edges']).map((e) => Edges.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['edges'] = edges.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
