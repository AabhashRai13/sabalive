import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/cart_controller.dart';
import 'package:sabalive/screens/payment/unpaid_page.dart';

import '../../app_properties.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final CartController cartController = Get.put(CartController());
  SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: () {},
        child: Text(
          "Proceed To Checkout",
          style: TextStyle(color: darkgreen, fontSize: 16),
        ),
        color: Colors.white,
        padding: EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10),
      ),
    );

    Widget _buildLoadingWidget() {
      return SpinKitCircle(color: Colors.blue[400]);
    }

    Widget _successWidget() {
      return cartController.cart == null
          ? Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )
          : LayoutBuilder(
              builder: (_, constraints) => SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 15),
                        height: 120.0,
                        color: darkgreen,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  cartController.priceTotal.value.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            checkOutButton
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        height: Get.height - 200,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cartController.cartList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Dismissible(
                                  onDismissed: (direction) {
                                    cartController.deleteCartList(
                                        cartController.cartList[index].id,
                                        index);
                                  },
                                  key: ObjectKey(cartController
                                      .cart.data.cartproducts[index]),
                                  child: Card(
                                      margin: EdgeInsets.all(10.0),
                                      child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cartController
                                                        .cartList[index]
                                                        .product
                                                        .title
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "Rate: " +
                                                        "Rs " +
                                                        cartController
                                                            .cartList[index]
                                                            .product
                                                            .sellingPrice
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "Quantity: " +
                                                        cartController
                                                            .cartList[index]
                                                            .quantity
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "Subtotal: " +
                                                        (double.parse(cartController
                                                                    .cartList[
                                                                        index]
                                                                    .rate) *
                                                                cartController
                                                                    .cartList[
                                                                        index]
                                                                    .quantity)
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child:
                                                    Icon(Icons.delete_forever),
                                              )
                                            ],
                                          ))),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.payment),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => UnpaidPage())),
            )
          ],
          title: Text(
            'Checkout',
            style: TextStyle(
                color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        body: Obx(() => cartController.state == ViewState.Busy
            ? _buildLoadingWidget()
            : _successWidget()));
  }
}
