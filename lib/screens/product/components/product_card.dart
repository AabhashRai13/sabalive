import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  
  ProductCard(
      this.product, {
        Key key,
      }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: null,
        child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width / 2 - 29,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.teal[500]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width / 2 - 64,
                    height: MediaQuery.of(context).size.width / 2 - 64,
                    child: Image.asset(
                      product.image,
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment(1, 0.5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.teal[700],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          product.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        )),
                  ),
                )
              ],
            )));
  }
}