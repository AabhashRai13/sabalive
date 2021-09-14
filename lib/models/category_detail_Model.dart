// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryDetailModel categoryDetailModelFromJson(String str) => CategoryDetailModel.fromJson(json.decode(str));

String categoryDetailModelToJson(CategoryDetailModel data) => json.encode(data.toJson());

class CategoryDetailModel {
  CategoryDetailModel({
    this.status,
    this.storeId,
    this.data,
  });
  
  String status;
  int storeId;
  List<Datum> data;
  
  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) => CategoryDetailModel(
    status: json["status"],
    storeId: json["store_id"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
  
  Map<String, dynamic> toJson() => {
    "status": status,
    "store_id": storeId,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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
  
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
