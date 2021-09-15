import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.id,
    this.title,
    // this.updatedAt,
    // this.publishedAt,
    this.images,
  });

  String? id;
  String? title;
  // DateTime? updatedAt;
  // DateTime? publishedAt;
  Images? images;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // publishedAt: DateTime.parse(json["publishedAt"]),
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        // "updatedAt": updatedAt.toIso8601String(),
        // "publishedAt": publishedAt.toIso8601String(),
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

  FluffyNode? node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.originalSrc,
    this.transformedSrc,
  });

  String? originalSrc;
  String? transformedSrc;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        originalSrc: json["originalSrc"],
        transformedSrc: json["transformedSrc"],
      );

  Map<String, dynamic> toJson() => {
        "originalSrc": originalSrc,
        "transformedSrc": transformedSrc,
      };
}
