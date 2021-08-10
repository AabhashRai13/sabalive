// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);

import 'dart:convert';

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  RegistrationResponse({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
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
    this.username,
    this.password,
    this.name,
    this.image,
    this.mobile,
    this.city,
    this.streetAddress,
  });

  String username;
  String password;
  String name;
  dynamic image;
  String mobile;
  int city;
  String streetAddress;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        password: json["password"],
        name: json["name"],
        image: json["image"],
        mobile: json["mobile"],
        city: json["city"],
        streetAddress: json["street_address"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "name": name,
        "image": image,
        "mobile": mobile,
        "city": city,
        "street_address": streetAddress,
      };
}
