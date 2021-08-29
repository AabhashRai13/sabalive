import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';
import 'package:sabalive/screens/main/components/homepage/ProductContainer.dart';

class StoreWiseProduct extends StatelessWidget {
  StoreWiseProduct({this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: homeController.storeWiseProducts == null
                  ? Text("loading...")
                  : Text(homeController.storeWiseProducts.data.storeName,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      )),
            ),
            Container(
              height: 200.0,
              child: homeController.products.length != null
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.products.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return StoreWiseProductContainer(
                          product: homeController.products[index],
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
