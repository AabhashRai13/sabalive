import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/wishlist_controller.dart';
import 'package:sabalive/models/product_detail_model.dart';
import '../../../../app_properties.dart';

class ProductDetailAppbar extends StatelessWidget {
  ProductDetailAppbar({
    Key key, this.product,
  }) : super(key: key);
final WishlistController wishlistController=Get.put(WishlistController());
  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
            child: Icon(CupertinoIcons.back)
          ),
        ),
      ),
      iconTheme: IconThemeData(color: darkGrey),
      actions: <Widget>[
      Obx(() => Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    if (wishlistController.productList.contains(product)) {
                      wishlistController.removeProduct(product);
                    } else {
                      wishlistController.addProduct(product);
                    }
                  },
                  child: wishlistController.productList.contains(product)?Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ):Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
              ),
            ))      ],
    );
  }
}
