// To parse this JSON data, do
//
//     final paymentListModel = paymentListModelFromJson(jsonString);

import 'dart:convert';

PaymentListModel paymentListModelFromJson(String str) => PaymentListModel.fromJson(json.decode(str));

String paymentListModelToJson(PaymentListModel data) => json.encode(data.toJson());

class PaymentListModel {
    PaymentListModel({
        this.status,
        this.data,
    });

    String status;
    List<Datum> data;

    factory PaymentListModel.fromJson(Map<String, dynamic> json) => PaymentListModel(
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
        this.image,
    });

    int id;
    String title;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}
