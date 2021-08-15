// To parse this JSON data, do
//
//     final storeWiseProducts = storeWiseProductsFromJson(jsonString);

import 'dart:convert';

StoreWiseProducts storeWiseProductsFromJson(String str) =>
    StoreWiseProducts.fromJson(json.decode(str));

String storeWiseProductsToJson(StoreWiseProducts data) =>
    json.encode(data.toJson());

class StoreWiseProducts {
  StoreWiseProducts({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory StoreWiseProducts.fromJson(Map<String, dynamic> json) =>
      StoreWiseProducts(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.storeName,
    this.products,
  });

  int id;
  String storeName;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        storeName: json["store_name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_name": storeName,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.markedPrice,
    this.sellingPrice,
  });

  int id;
  String title;
  String markedPrice;
  String sellingPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        markedPrice: json["marked_price"],
        sellingPrice: json["selling_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "marked_price": markedPrice,
        "selling_price": sellingPrice,
      };
}
