import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/product_image_controller.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/screens/product/components/detail_page/small_products.dart';

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
          child: SizedBox(
            width: MediaQuery.of(context).size.height * 0.3,
            child: AspectRatio(
              aspectRatio: 1,
              child: Hero(
                  tag: product.data.displayImage,
                  child: Image.network(product.data.displayImage)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                _productlist.length,
                (index) => SmallProduct(
                      product: _productlist[index],
                    ))
          ],
        )
      ],
    );
  }
}
