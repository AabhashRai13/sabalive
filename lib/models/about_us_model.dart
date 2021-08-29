
import 'dart:convert';

AboutUs aboutusFromJson(String str) => AboutUs.fromJson(json.decode(str));

String aboutusToJson(AboutUs data) => json.encode(data.toJson());

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
    this.storeName,
    this.image,
    this.state,
    this.city,
    this.streetAddress,
    this.contact,
    this.altContact,
    this.email,
  });
  
  String storeName;
  String image;
  int state;
  int city;
  String streetAddress;
  String contact;
  dynamic altContact;
  String email;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    storeName: json["store_name"],
    image: json["image"],
    state: json["state"],
    city: json["city"],
    streetAddress: json["street_address"],
    contact: json["contact"],
    altContact: json["alt_contact"],
    email: json["email"],
  );
  
  Map<String, dynamic> toJson() => {
    "store_name": storeName,
    "image": image,
    "state": state,
    "city": city,
    "street_address": streetAddress,
    "contact": contact,
    "alt_contact": altContact,
    "email": email,
  };
}
