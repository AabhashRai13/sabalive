// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    this.status,
    this.data,
  });
  
  String status;
  List<Datum> data;
  
  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
  
  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.image,
    this.content,
    this.views,
    this.store,
    this.iconUrl,
  });
  
  int id;
  String title;
  String image;
  String content;
  int views;
  int store;
  String iconUrl;
  
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    content: json["content"],
    views: json["views"],
    store: json["store"],
    iconUrl: json["icon_url"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "content": content,
    "views": views,
    "store": store,
    "icon_url": iconUrl,
  };
}
