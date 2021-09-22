// To parse this JSON data, do
//
//     final updateProfileResponse = updateProfileResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
  UpdateProfileResponse({
    this.status,
    this.data,
  });
  
  String status;
  Data data;
  
  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
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
    this.name,
    this.image,
    this.mobile,
    this.city,
    this.streetAddress,
  });
  
  String name;
  String image;
  String mobile;
  int city;
  String streetAddress;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
