import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';
import 'package:sabalive/screens/main/components/homepage/ProductContainer.dart';
import 'package:shimmer/shimmer.dart';

class StoreWiseProduct extends StatelessWidget {
  StoreWiseProduct({this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: homeController.storeWiseProducts == null
                ? Shimmer.fromColors(
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: ShapeDecoration(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                    baseColor: Colors.grey[400],
                    highlightColor: Colors.grey[300])
                : Text(
                    homeController.storeWiseProducts.data.storeName.capitalize,
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    )),
          ),
          homeController.state==ViewState.Busy?Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Shimmer.fromColors(child: Container(height: 180,decoration: ShapeDecoration(
              color: Colors.grey[400],
              shape: RoundedRectangleBorder(),

            ),),
                baseColor: Colors.grey[400], highlightColor: Colors.grey[300]),
          ):Container(
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
    );
  }
}
