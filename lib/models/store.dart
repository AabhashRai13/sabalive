import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
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
