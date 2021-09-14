// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
  });
  
  String status;
  Message message;
  
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: Message.fromJson(json["message"]),
  );
  
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message.toJson(),
  };
}

class Message {
  Message({
    this.name,
    this.image,
    this.mobile,
    this.city,
    this.streetAddress,
  });
  
  String name;
  String image;
  String mobile;
  dynamic city;
  dynamic streetAddress;
  
  factory Message.fromJson(Map<String, dynamic> json) => Message(
    name: json["name"],
    image: json["image"],
    mobile: json["mobile"],
    city: json["city"],
    streetAddress: json["street_address"],
  );
  
  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "mobile": mobile,
    "city": city,
    "street_address": streetAddress,
  };
}
