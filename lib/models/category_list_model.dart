// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) => CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
    this.status,
    this.storeId,
    this.data,
  });
  
  String status;
  int storeId;
  List<Datum> data;
  
  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
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
    this.image,
  });
  
  int id;
  String title;
  String image;
  
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
