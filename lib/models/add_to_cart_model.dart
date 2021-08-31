import 'dart:convert';

AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
  AddToCart({
    this.status,
    this.message,
    this.cartId,
    this.cartProductId,
  });
  
  String status;
  String message;
  int cartId;
  int cartProductId;
  
  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
    status: json["status"],
    message: json["message"],
    cartId: json["cart_id"],
    cartProductId: json["cart_product_id"],
  );
  
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "cart_id": cartId,
    "cart_product_id": cartProductId,
  };
}
