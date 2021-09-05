import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/add_to_cart_controller.dart';
import 'package:sabalive/controllers/product_detail_controller.dart';
import 'package:sabalive/screens/product/components/detail_page/product_detail_appbar.dart';
import 'package:sabalive/screens/product/components/detail_page/top_rounded_container.dart';
import 'components/detail_page/product_display.dart';

class ProductPage extends StatelessWidget {

final int productId;
final ProductDetailsController _productDetailsController =
Get.put(ProductDetailsController());
ProductPage({Key key, this.productId}) : super(key: key);
  final AddToCartController addToCartController =
      Get.put(AddToCartController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        
        body: GetBuilder<ProductDetailsController>(
          // specify type as Controller
            init: _productDetailsController.setProductId(
                productId: productId), // intialize with the Controller
            builder: (value) =>
            _productDetailsController.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget()));
  }

Widget _buildLoadingWidget() {
  return SpinKitCircle(color: Colors.blue[400]);
}

Widget _buildSuccessWidget() {
  return _productDetailsController.productDetails == null
      ? Center(
    child: Text("No Data"),
  )
      : CustomScrollView(
    slivers: [
      ProductDetailAppbar(),
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductDisplay(
            product: _productDetailsController.productDetails,
            ),
            SizedBox(
              height: 10,
            ),
            TopRoundedContainer(
              product: _productDetailsController.productDetails,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    ],
  );
}
}