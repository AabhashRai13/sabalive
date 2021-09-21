// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
    Token({
        this.name,
        this.email,
        this.mobile,
        this.streetAddress,
        this.refresh,
        this.access,
    });

    String name;
    String email;
    String mobile;
    dynamic streetAddress;
    String refresh;
    String access;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        streetAddress: json["street_address"],
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "street_address": streetAddress,
        "refresh": refresh,
        "access": access,
    };
}
