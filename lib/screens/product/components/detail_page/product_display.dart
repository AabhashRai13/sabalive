import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/product_image_controller.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/models/product_detail_model.dart';

class ProductDisplay extends StatelessWidget {
  final ProductImageController productImageController =
      Get.put(ProductImageController());
  final ProductDetails product;

  ProductDisplay({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> _productlist = [
      Product("assets/whitechicken.png", "Chicken", "Full Chicken", 125),
      Product(
          "assets/buffalo-chicken-wing.png", "Chicken", "Full Chicken", 125),
      Product("assets/chicken.png", "Chicken", "Full Chicken", 125),
    ];
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 2,
              child: Hero(
                  tag: product.data.displayImage,
                  child: Image.network(product.data.displayImage,fit: BoxFit.contain,)),
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(
        //         _productlist.length,
        //         (index) => SmallProduct(
        //               product: _productlist[index],
        //             ))
        //   ],
        // )
      ],
    );
  }
}
