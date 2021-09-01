import 'dart:convert';

Storess storeFromJson(String str) => Storess.fromJson(json.decode(str));

String storeToJson(Storess data) => json.encode(data.toJson());

class Storess {
  Storess({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory Storess.fromJson(Map<String, dynamic> json) => Storess(
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
