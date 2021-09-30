import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/utils/sizeConfig.dart';

class ProductDetailAppbar extends StatelessWidget {
  ProductDetailAppbar({
    Key key, this.product,
  }) : super(key: key);
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
          child: Icon(CupertinoIcons.back),
        ),
      ),
  
      iconTheme: IconThemeData(color: Colors.black,size: SizeConfig.safeBlockHorizontal*7),
     
    );
  }
}
