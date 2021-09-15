import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';

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
                      left: 16.0, right: 16.0, top: 28.0, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your OrderList',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.red[600]),
                      ),
                    ],
                  ),
                ),
                gap(12, 0),
                Expanded(
                  child: ListView(
                    children: List.generate(
                        orderPageController.orderList.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Number of Product:',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  gap(0, 10),
                                  Text(
                                    orderPageController
                                        .orderList[index].products.length
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              gap(10, 0),
                              ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: List.generate(
                                    orderPageController.orderList[index]
                                        .products.length, (index2) {
                                  return Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                productInfoTextHeadings(
                                                    'Product Name:'),
                                                productInfoTextHeadings(
                                                    'Price'),
                                                productInfoTextHeadings(
                                                    'Quantity:'),
                                                productInfoTextHeadings(
                                                    'Total:'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                productInfoTextSubHeaddings(
                                                    orderPageController
                                                        .orderList[index]
                                                        .products[index2]
                                                        .product
                                                        .toString()),
                                                productInfoTextSubHeaddings(
                                                    orderPageController
                                                        .orderList[index]
                                                        .products[index2]
                                                        .price
                                                        .toString()),
                                                productInfoTextSubHeaddings(
                                                    orderPageController
                                                        .orderList[index]
                                                        .products[index2]
                                                        .quantity
                                                        .toString()),
                                                productInfoTextSubHeaddings(
                                                    orderPageController
                                                        .orderList[index]
                                                        .products[index2]
                                                        .total
                                                        .toString()),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
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
      fontSize: 16,
      color: Colors.red,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget productInfoTextSubHeaddings(String val) {
  return Text(
    val,
    style: TextStyle(
      fontSize: 16,
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
