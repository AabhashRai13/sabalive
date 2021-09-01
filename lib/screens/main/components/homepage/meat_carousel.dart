import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/main/components/product_list.dart';

class MeatCarousel extends StatelessWidget {
  const MeatCarousel(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.productList})
      : super(key: key);

  final String title;
  final String subtitle;
  final List<Product> productList;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(title,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'view all',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          //  ProductList(products: productList)
        ],
      ),
    );
  }
}
