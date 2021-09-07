import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/cart_controller.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/address/add_address_page.dart';
import 'package:sabalive/screens/payment/unpaid_page.dart';

import '../../app_properties.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final CartController cartController = Get.put(CartController());
  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product('assets/headphones.png',
        'Boat roackerz 400 On-Ear Bluetooth Headphones', 'description', 45.3),
    Product('assets/headphones_2.png',
        'Boat roackerz 100 On-Ear Bluetooth Headphones', 'description', 22.3),
    Product('assets/headphones_3.png',
        'Boat roackerz 300 On-Ear Bluetooth Headphones', 'description', 58.3)
  ];

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: mainButtonColor,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    Widget _buildLoadingWidget() {
      return SpinKitCircle(color: Colors.blue[400]);
    }
    
    Widget _successWidget() {
      return cartController.cart == null
          ? Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )
          : LayoutBuilder(
              builder: (_, constraints) => SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        height: 48.0,
                        color: darkgreen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              cartController.cart.data.subtotal,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        height: Get.height-200,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount:
                                cartController.cart.data.cartproducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              final cartInfo = cartController.cart.data.cartproducts[index];
                              return Container(
                                child: Dismissible(
                                  key: ObjectKey(cartInfo),
                                  child: Card(
                                      margin: EdgeInsets.all(10.0),
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cartInfo.product
                                                      .toString(),
                                                  style:
                                                  TextStyle(color: Colors.black),
                                                ),
                                                Text(
                                                  "Rate: "+ "Rs "+
                                                      cartInfo.rate
                                                          .toString(),
                                                  style:
                                                  TextStyle(color: Colors.black),
                                                ),
                                                Text(
                                                  "Quantity: "+
                                                      cartInfo.quantity
                                                          .toString(),
                                                  style:
                                                  TextStyle(color: Colors.black),
                                                ),
  
                                                Text(
                                                  "Subtotal: "+
                                                      cartInfo.subtotal
                                                          .toString(),
                                                  style:
                                                  TextStyle(color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                              },
                                              child: Icon(Icons.delete_forever),
                                            )
                                          ],
                                        )
                                      )),
                                ),
                              );
                            }),
                      ),
                      checkOutButton
                    ],
                  ),
                ),
              ),
            );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.payment),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => UnpaidPage())),
            )
          ],
          title: Text(
            'Checkout',
            style: TextStyle(
                color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        
        body: Obx(() => cartController.state == ViewState.Busy
            ? _buildLoadingWidget()
            : _successWidget()));
  }
}
