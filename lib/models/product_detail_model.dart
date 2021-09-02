// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
    this.data,
    this.relatedProducts,
  });
  
  Data data;
  List<dynamic> relatedProducts;
  
  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    data: Data.fromJson(json["data"]),
    relatedProducts:
    List<dynamic>.from(json["related_products"].map((x) => x)),
  );
  
  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "related_products": List<dynamic>.from(relatedProducts.map((x) => x)),
  };
}

class Data {
  Data({
    this.id,
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
    this.store,
    this.iconUrl,
  });
  
  int id;
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
  Store store;
  String iconUrl;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
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
    store: Store.fromJson(json["store"]),
    iconUrl: json["icon_url"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
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
    "store": store.toJson(),
    "icon_url": iconUrl,
  };
}

class Store {
  Store({
    this.id,
    this.name,
    this.storeName,
  });
  
  int id;
  String name;
  String storeName;
  
  factory Store.fromJson(Map<String, dynamic> json) => Store(
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