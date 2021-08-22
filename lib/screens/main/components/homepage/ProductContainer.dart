import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';

class StoreContainer extends StatelessWidget {
  final Product product;
  
  const StoreContainer({
    Key key,
    @required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration( color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(18.0),
                            image: DecorationImage(
                                image: AssetImage(product.image)
                            )
                        ),
                        // child: Image.asset('assets/images/deals_fries.png'),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )
              ),
              SizedBox(height: 2.5),
              Row(
                children: <Widget>[
                  SizedBox(width: 3.0),
                  Text("Rs "+
                    product.price.toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
