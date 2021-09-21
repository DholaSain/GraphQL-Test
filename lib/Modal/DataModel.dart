import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.title,
    this.image,
    this.description,
    this.products,
  });

  String? title;
  CollectionImages? image;
  String? description;
  Products? products;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        title: json["title"],
        image: CollectionImages.fromJson(json["image"]),
        description: json["description"],
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image!.toJson(),
        "description": description,
        "products": products!.toJson(),
      };
}

class CollectionImages {
  CollectionImages({
    this.originalSrc,
  });

  String? originalSrc;

  factory CollectionImages.fromJson(Map<String, dynamic> json) =>
      CollectionImages(
        originalSrc: json["originalSrc"],
      );

  Map<String, dynamic> toJson() => {
        "originalSrc": originalSrc,
      };
}

class Products {
  Products({
    this.edges,
  });

  List<ProductsEdge>? edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        edges: List<ProductsEdge>.from(
            json["edges"].map((x) => ProductsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductsEdge {
  ProductsEdge({
    this.node,
  });

  FluffyNode? node;

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.availableForSale,
    this.description,
    this.title,
    this.vendor,
    this.totalInventory,
    this.options,
    this.priceRange,
    this.images,
  });

  bool? availableForSale;
  String? description;
  String? title;
  Vendor? vendor;
  int? totalInventory;
  List<Option>? options;
  PriceRange? priceRange;
  Images? images;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        availableForSale: json["availableForSale"],
        description: json["description"],
        title: json["title"],
        vendor: vendorValues.map[json["vendor"]],
        totalInventory: json["totalInventory"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        priceRange: PriceRange.fromJson(json["priceRange"]),
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "availableForSale": availableForSale,
        "description": description,
        "title": title,
        "vendor": vendorValues.reverse[vendor],
        "totalInventory": totalInventory,
        "options": List<dynamic>.from(options!.map((x) => x.toJson())),
        "priceRange": priceRange!.toJson(),
        "images": images!.toJson(),
      };
}

class Images {
  Images({
    this.edges,
  });

  List<ImagesEdge>? edges;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: List<ImagesEdge>.from(
            json["edges"].map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  ImagesEdge({
    this.node,
  });

  CollectionImages? node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: CollectionImages.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class Option {
  Option({
    this.name,
    this.values,
  });

  Name? name;
  List<Value>? values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: nameValues.map[json["name"]],
        values: List<Value>.from(json["values"].map((x) => valueValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "values":
            List<dynamic>.from(values!.map((x) => valueValues.reverse[x])),
      };
}

enum Name { SIZE }

final nameValues = EnumValues({"Size": Name.SIZE});

enum Value { UNSTITCHED, XS, S, M, L, XL, XXL }

final valueValues = EnumValues({
  "L": Value.L,
  "M": Value.M,
  "S": Value.S,
  "UNSTITCHED": Value.UNSTITCHED,
  "XL": Value.XL,
  "XS": Value.XS,
  "XXL": Value.XXL
});

class PriceRange {
  PriceRange({
    this.maxVariantPrice,
  });

  MaxVariantPrice? maxVariantPrice;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        maxVariantPrice: MaxVariantPrice.fromJson(json["maxVariantPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "maxVariantPrice": maxVariantPrice!.toJson(),
      };
}

class MaxVariantPrice {
  MaxVariantPrice({
    this.amount,
  });

  String? amount;

  factory MaxVariantPrice.fromJson(Map<String, dynamic> json) =>
      MaxVariantPrice(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

enum Vendor { NUREH }

final vendorValues = EnumValues({"Nureh": Vendor.NUREH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: unnecessary_null_comparison
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
