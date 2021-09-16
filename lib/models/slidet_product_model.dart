// To parse this JSON data, do
//
//     final sliderProductModel = sliderProductModelFromJson(jsonString);

import 'dart:convert';

SliderProductModel sliderProductModelFromJson(String str) => SliderProductModel.fromJson(json.decode(str));

String sliderProductModelToJson(SliderProductModel data) => json.encode(data.toJson());

class SliderProductModel {
  SliderProductModel({
    this.status,
    this.data,
  });
  
  String status;
  List<Datum> data;
  
  factory SliderProductModel.fromJson(Map<String, dynamic> json) => SliderProductModel(
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
    this.shortTitle,
    this.content,
    this.image,
    this.actionLinkName,
  });
  
  int id;
  String title;
  dynamic shortTitle;
  String content;
  String image;
  dynamic actionLinkName;
  
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    shortTitle: json["short_title"],
    content: json["content"],
    image: json["image"],
    actionLinkName: json["action_link_name"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "short_title": shortTitle,
    "content": content,
    "image": image,
    "action_link_name": actionLinkName,
  };
}
