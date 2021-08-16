import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/product/view_product_page.dart';

import '../search_page.dart';
import 'components/product_display.dart';

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

    return Scaffold(
      backgroundColor: lightgreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: darkGrey,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
          )
        ],
        title: Text(
          product.name,
          style: const TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 SizedBox(height: 20.0,),
                  ProductDisplay(
                    product: product,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '\$ ${product.price}',
                                  style: const TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Montserrat",
                                      fontSize: 36.0)),
                              TextSpan(
                                  text: '.58',
                                  style: const TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Montserrat",
                                      fontSize: 18.0))
                            ])),
                        
                            Container(
                              decoration: BoxDecoration(
                                color: mainButtonColor,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Color(0xFFFFFFFF), width: 0.5),
                              ),
                              child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: TextButton(
                                    onPressed: () {
                                    
                                    },
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                    )),
                              ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                    Get.to(ViewProductPage(product: product,));
                  },
                          child: Container(
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(
                              color: mainButtonColor,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                  color: Color(0xFFFFFFFF), width: 0.5),
                            ),
                            child: Center(
                              child: new Text("Details",
                                  style: const TextStyle(
                                      color: const Color(0xeefefefe),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
  
                  Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 40.0, bottom: 130),
                      child: new Text(product.description,
                          style: const TextStyle(
                              color: const Color(0xfefefefe),
                              fontWeight: FontWeight.w800,
                              fontFamily: "NunitoSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0)))
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
