// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Productwisedetails productwiseDetailsFromJson(String str) => Productwisedetails.fromJson(json.decode(str));

String productwiseDetailsToJson(Productwisedetails data) => json.encode(data.toJson());

class Productwisedetails {
  Productwisedetails({
    this.data,
    this.relatedProducts,
  });
  
  Data data;
  List<RelatedProduct> relatedProducts;
  
  factory Productwisedetails.fromJson(Map<String, dynamic> json) => Productwisedetails(
    data: Data.fromJson(json["data"]),
    relatedProducts: List<RelatedProduct>.from(json["related_products"].map((x) => RelatedProduct.fromJson(x))),
  );
  
  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "related_products": List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.store,
    this.title,
    this.category,
    this.description,
    this.displayImage,
    this.remarks,
    this.saleCount,
    this.returnPolicy,
    this.instock,
    this.views,
    this.markedPrice,
    this.sellingPrice,
  });
  
  Stores store;
  String title;
  int category;
  String description;
  String displayImage;
  dynamic remarks;
  int saleCount;
  String returnPolicy;
  int instock;
  int views;
  String markedPrice;
  String sellingPrice;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    store: Stores.fromJson(json["store"]),
    title: json["title"],
    category: json["category"],
    description: json["description"],
    displayImage: json["display_image"],
    remarks: json["remarks"],
    saleCount: json["sale_count"],
    returnPolicy: json["return_policy"],
    instock: json["instock"],
    views: json["views"],
    markedPrice: json["marked_price"],
    sellingPrice: json["selling_price"],
  );
  
  Map<String, dynamic> toJson() => {
    "store": store.toJson(),
    "title": title,
    "category": category,
    "description": description,
    "display_image": displayImage,
    "remarks": remarks,
    "sale_count": saleCount,
    "return_policy": returnPolicy,
    "instock": instock,
    "views": views,
    "marked_price": markedPrice,
    "selling_price": sellingPrice,
  };
}

class Stores {
  Stores({
    this.id,
    this.name,
    this.storeName,
  });
  
  int id;
  String name;
  String storeName;
  
  factory Stores.fromJson(Map<String, dynamic> json) => Stores(
    id: json["id"],
    name: json["name"],
    storeName: json["store_name"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "store_name": storeName,
  };
}

class RelatedProduct {
  RelatedProduct({
    this.id,
    this.title,
    this.displayImage,
    this.markedPrice,
    this.sellingPrice,
  });
  
  int id;
  String title;
  String displayImage;
  String markedPrice;
  String sellingPrice;
  
  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
    id: json["id"],
    title: json["title"],
    displayImage: json["display_image"],
    markedPrice: json["marked_price"],
    sellingPrice: json["selling_price"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "display_image": displayImage,
    "marked_price": markedPrice,
    "selling_price": sellingPrice,
  };
}
