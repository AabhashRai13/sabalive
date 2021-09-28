// To parse this JSON data, do
//
//     final aboutUs = aboutUsFromJson(jsonString);

import 'dart:convert';

AboutUs aboutUsFromJson(String str) => AboutUs.fromJson(json.decode(str));

String aboutUsToJson(AboutUs data) => json.encode(data.toJson());

class AboutUs {
  AboutUs({
    this.status,
    this.data,
  });
  
  String status;
  Data data;
  
  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
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
    this.image,
    this.state,
    this.city,
    this.streetAddress,
    this.contact,
    this.altContact,
    this.email,
    this.iconUrl,
  });
  
  int id;
  String storeName;
  String image;
  String state;
  String city;
  String streetAddress;
  String contact;
  dynamic altContact;
  String email;
  String iconUrl;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    storeName: json["store_name"],
    image: json["image"],
    state: json["state"],
    city: json["city"],
    streetAddress: json["street_address"],
    contact: json["contact"],
    altContact: json["alt_contact"],
    email: json["email"],
    iconUrl: json["icon_url"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "store_name": storeName,
    "image": image,
    "state": state,
    "city": city,
    "street_address": streetAddress,
    "contact": contact,
    "alt_contact": altContact,
    "email": email,
    "icon_url": iconUrl,
  };
}
