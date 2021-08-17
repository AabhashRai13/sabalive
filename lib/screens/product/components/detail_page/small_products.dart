import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';

class SmallProduct extends StatelessWidget {
  const SmallProduct({
    Key key, this.product,
  }) : super(key: key);
  
  final Product product;
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8.0),
        height: width*0.25,
        width: width*0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.blue
            )
        ),
        child: Image.asset(
            product.image
        ),
      ),
    );
  }
}