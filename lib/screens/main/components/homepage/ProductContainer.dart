import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';
import 'package:sabalive/screens/product/product_detail_page.dart';

class StoreWiseProductContainer extends StatelessWidget {
  final Product product;

  const StoreWiseProductContainer({Key key, @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductPage(
              productId: product.id,
            ));
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
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(18.0),
                          image: DecorationImage(
                              image: AssetImage(product.displayImage))),
                      // child: Image.asset('assets/images/deals_fries.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(product.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              SizedBox(height: 2.5),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      SizedBox(width: 3.0),
                      Text(
                        "Selling price",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        "Rs " + product.sellingPrice.toString(),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 3.0),
                      Text(
                        "Marked price",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        "Rs " + product.markedPrice.toString(),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
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
