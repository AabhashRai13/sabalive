// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
    OrderList({
        this.status,
        this.data,
    });

    String status;
    List<Datum> data;

    factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
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
        this.cart,
        this.subtotal,
        this.discount,
        this.shippingCharge,
        this.shippingChargeDiscount,
        this.nettotal,
        this.paymentMethod,
        this.customerPaymentStatus,
    });

    int id;
    Carts cart;
    String subtotal;
    String discount;
    int shippingCharge;
    int shippingChargeDiscount;
    String nettotal;
    dynamic paymentMethod;
    bool customerPaymentStatus;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        cart: Carts.fromJson(json["cart"]),
        subtotal: json["subtotal"],
        discount: json["discount"],
        shippingCharge: json["shipping_charge"],
        shippingChargeDiscount: json["shipping_charge_discount"],
        nettotal: json["nettotal"],
        paymentMethod: json["payment_method"],
        customerPaymentStatus: json["customer_payment_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cart": cart.toJson(),
        "subtotal": subtotal,
        "discount": discount,
        "shipping_charge": shippingCharge,
        "shipping_charge_discount": shippingChargeDiscount,
        "nettotal": nettotal,
        "payment_method": paymentMethod,
        "customer_payment_status": customerPaymentStatus,
    };
}

class Carts {
    Carts({
        this.cartproducts,
    });

    List<Cartproduct> cartproducts;

    factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        cartproducts: List<Cartproduct>.from(json["cartproducts"].map((x) => Cartproduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cartproducts": List<dynamic>.from(cartproducts.map((x) => x.toJson())),
    };
}

class Cartproduct {
    Cartproduct({
        this.product,
        this.quantity,
        this.rate,
        this.shippingCharge,
        this.subtotal,
        this.orderStatus,
    });

    String product;
    int quantity;
    String rate;
    int shippingCharge;
    String subtotal;
    String orderStatus;

    factory Cartproduct.fromJson(Map<String, dynamic> json) => Cartproduct(
        product: json["product"],
        quantity: json["quantity"],
        rate: json["rate"],
        shippingCharge: json["shipping_charge"],
        subtotal: json["subtotal"],
        orderStatus: json["order_status"],
    );

    Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "rate": rate,
        "shipping_charge": shippingCharge,
        "subtotal": subtotal,
        "order_status": orderStatus,
    };
}
