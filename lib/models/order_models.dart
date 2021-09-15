// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

List<OrderList> orderListFromJson(String str) => List<OrderList>.from(json.decode(str).map((x) => OrderList.fromJson(x)));

String orderListToJson(List<OrderList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderList {
    OrderList({
        this.products,
        this.total,
        this.totalItems,
        this.shipping,
        this.orderId,
        this.remark,
        this.isShipped,
        this.isDelivered,
    });

    List<Product> products;
    double total;
    int totalItems;
    int shipping;
    String orderId;
    String remark;
    bool isShipped;
    bool isDelivered;

    factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        totalItems: json["total_items"],
        shipping: json["shipping"],
        orderId: json["order_id"],
        remark: json["remark"],
        isShipped: json["is_shipped"],
        isDelivered: json["is_delivered"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "total_items": totalItems,
        "shipping": shipping,
        "order_id": orderId,
        "remark": remark,
        "is_shipped": isShipped,
        "is_delivered": isDelivered,
    };

  static List<OrderList> mapArray(List<dynamic> data) {
        return data
            .map<OrderList>((json) => OrderList.fromJson(json))
            .toList();
    }

}

class Product {
    Product({
        this.product,
        this.price,
        this.quantity,
        this.total,
    });

    String product;
    double price;
    int quantity;
    double total;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        product: json["product"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "product": product,
        "price": price,
        "quantity": quantity,
        "total": total,
    };
}
