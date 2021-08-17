import 'package:flutter/material.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/product/components/product_options.dart';

import '../../app_properties.dart';
import '../search_page.dart';
import 'components/more_products.dart';

class ViewProductPage extends StatefulWidget {
  final Product product;
  
  ViewProductPage({Key key, this.product}) : super(key: key);
  
  @override
  _ViewProductPageState createState() => _ViewProductPageState(product);
}

class _ViewProductPageState extends State<ViewProductPage> {
  final Product product;
  
  _ViewProductPageState(this.product);
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  int active;
  
  
  @override
  Widget build(BuildContext context) {
    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        product.description,
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
      ),
    );
    
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: lightgreen,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          actions: <Widget>[
            IconButton(
              icon:
              Icon(Icons.search),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
            )
          ],
          title: Text(
            product.name,
            style: const TextStyle(
                color: darkGrey,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                fontSize: 18.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                ProductOption(
                  _scaffoldKey,
                  product: product,
                ),
                description,
                MoreProducts()
              ],
            ),
          ),
        ));
  }
}