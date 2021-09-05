// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

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
        cartproducts: List<Cartproduct>.from(
            json["cartproducts"].map((x) => Cartproduct.fromJson(x))),
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
    this.productRequest,
    this.product,
    this.quantity,
    this.rate,
    this.subtotal,
  });

  int id;
  dynamic productRequest;
  Product product;
  int quantity;
  String rate;
  String subtotal;

  factory Cartproduct.fromJson(Map<String, dynamic> json) => Cartproduct(
        id: json["id"],
        productRequest: json["product_request"],
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        rate: json["rate"],
        subtotal: json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_request": productRequest,
        "product": product.toJson(),
        "quantity": quantity,
        "rate": rate,
        "subtotal": subtotal,
      };
}

class Product {
  Product({
    this.title,
    this.displayImage,
    this.sellingPrice,
  });

  String title;
  String displayImage;
  String sellingPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        displayImage: json["display_image"],
        sellingPrice: json["selling_price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "display_image": displayImage,
        "selling_price": sellingPrice,
      };
}
