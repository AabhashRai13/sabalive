import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/rating/rating_page.dart';

import '../../../app_properties.dart';

class ProductDisplay extends StatelessWidget {
  final Product product;
  const ProductDisplay({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Center(
            child: Container(
              height: screenAwareSize(220, context),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 18.0,
                    ),
                    child: Container(
                      child: Hero(
                        tag: product.image,
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                          height: 230,
                          width: 230,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Align(
            alignment: Alignment.topRight,
            child: RawMaterialButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => RatingPage())),
              constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
              child:
                  Icon(Icons.favorite, color: Colors.white),
              elevation: 0.0,
              shape: CircleBorder(),
              fillColor: mainButtonColor,
            ),
          ),
        ),
      ],
    );
  }
}