import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/main/components/homepage/ProductContainer.dart';

class FoodCarousel extends StatelessWidget {
  const FoodCarousel({Key key,
    @required this.title,
    @required this.subtitle,
    @required this.productList}) : super(key: key);

  final String title;
  final String subtitle;
  final List<Product> productList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              )
          ),
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
                onTap: () {
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          height: 200.0,
          child: productList!= null ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Product product= productList[index];
              return ProductContainer(
                product: product,
              );
            },
          ): Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
