// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
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
    this.name,
    this.storeName,
  });

  int id;
  String name;
  String storeName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        storeName: json["store_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "store_name": storeName,
      };
}
