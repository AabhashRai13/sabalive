import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/product/components/detail_page/product_detail_appbar.dart';
import 'package:sabalive/screens/product/components/detail_page/top_rounded_container.dart';

import 'components/detail_page/product_display.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  ProductPage({Key key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {
  final Product product;

  _ProductPageState(this.product);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:Container(
          width: width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: mainButtonColor,
            border: Border.all(color: Colors.blue),),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            ProductDetailAppbar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProductDisplay(
                      product: product,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TopRoundedContainer(
                      product: product,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
