import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';

import '../app_properties.dart';
import '../controllers/order_page_controller.dart';

class OrderPageView extends GetView<OrderPageController> {
  final OrderPageController orderPageController =
      Get.put(OrderPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => controller.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget())));
  }

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.red);
  }

  Widget _buildSuccessWidget() {
    return orderPageController.orderList  == null
        ? Center(
            child: Text(
              'No Orders!',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 28.0, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your OrderList',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: darkgreen),
                      ),
                    ],
                  ),
                ),
                gap(8, 0),
                Expanded(
                  child: ListView(
                    children: List.generate(
                        orderPageController.orderList.data.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: Offset(0, 0),
                                blurRadius: 7,
                                spreadRadius: 1)
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Number of Product:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                gap(0, 10),
                                Text(
                                  orderPageController
                                      .orderList.data[index].cart.cartproducts.length
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                  orderPageController.orderList.data[index].cart
                                      .cartproducts.length, (index2) {
                                return Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        productInfoTextSubHeaddings(
                                            orderPageController.orderList.data[index].cart
                                                .cartproducts[index2]
                                                .product
                                                .toString().capitalize),
                                        gap(5, 0),
  
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          productInfoTextHeadings(
                                                        'Price:'),
                                                    productInfoTextHeadings(
                                                        'Quantity:'),
                                                    productInfoTextHeadings(
                                                        'Total:'),
                                        ],
                                      ),
                                      gap(5, 0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          productInfoTextSubHeaddings(
                                                        orderPageController.orderList.data[index].cart
                                            .cartproducts[index2]
                                                            .rate
                                                            .toString()),
                                                    productInfoTextSubHeaddings(
                                                         orderPageController.orderList.data[index].cart
                                            .cartproducts[index2]
                                                            .quantity
                                                            .toString()),
                                                    productInfoTextSubHeaddings(
                                                      orderPageController.orderList.data[index].cart
                                            .cartproducts[index2]
                                                            .subtotal
                                                            .toString()),
                                        ],
                                      ),
                                        gap(5, 0),
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          productInfoTextSubHeaddings(
                                              'Order Status:'),
                                          productInfoTextHeadings(
                                              orderPageController.orderList.data[index].cart
                                                  .cartproducts[index2]
                                                  .orderStatus
                                                  .toString()),
                                        ],
                                      )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
  }
}

Widget productInfoTextHeadings(String val) {
  return Text(
    val,
    style: TextStyle(
      fontSize: 18,
      color: darkgreen,
      fontWeight: FontWeight.bold
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget productInfoTextSubHeaddings(String val) {
  return Text(
    val,
    style: TextStyle(
      fontSize: 18,
      color: Colors.black,
      // fontWeight: FontWeight.w300,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget gap(double hvalue, double wvalue) {
  return SizedBox(
    height: hvalue,
    width: wvalue,
  );
}
