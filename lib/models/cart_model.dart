// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.status,
    this.data,
  });
  
  String status;
  Data data;
  
  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
    this.subtotal,
    this.cartproducts,
  });
  
  int id;
  String subtotal;
  List<Cartproduct> cartproducts;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    subtotal: json["subtotal"],
    cartproducts: List<Cartproduct>.from(json["cartproducts"].map((x) => Cartproduct.fromJson(x))),
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "subtotal": subtotal,
    "cartproducts": List<dynamic>.from(cartproducts.map((x) => x.toJson())),
  };
}

class Cartproduct {
  Cartproduct({
    this.id,
    this.product,
    this.quantity,
    this.rate,
    this.subtotal,
  });
  
  int id;
  int product;
  int quantity;
  String rate;
  String subtotal;
  
  factory Cartproduct.fromJson(Map<String, dynamic> json) => Cartproduct(
    id: json["id"],
    product: json["product"],
    quantity: json["quantity"],
    rate: json["rate"],
    subtotal: json["subtotal"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product,
    "quantity": quantity,
    "rate": rate,
    "subtotal": subtotal,
  };
}
