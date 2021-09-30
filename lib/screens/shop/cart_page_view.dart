import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/cart_controller.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/screens/auth/welcome_back_page.dart';
import 'package:sabalive/screens/checkout_view.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';
import 'package:sabalive/utils/sizeConfig.dart';

import '../../app_properties.dart';

class CartPageView extends StatefulWidget {
  @override
  _CartPageViewState createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  final CartController cartController = Get.put(CartController());
  SwiperController swiperController = SwiperController();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  void initState() {
    super.initState();
    cartController.fetchCart();
  }

  @override
  void dispose() {
    cartController.priceTotal.value = 0;
    cartController.count.clear();
    cartController.priceTotalList.clear();
    cartController.quantityTotalList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget checkOutButton = Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
        child: GestureDetector(
          onTap: () {
            cartController.priceTotal.value == 0
                ? cartController.nothing()
                : Get.to(() => CheckoutView(), arguments: {
                    "total": cartController.priceTotal,
                    "cartId": cartController.cart.data.id
                  });
          },
          child: Container(
            height: 49,
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                "Proceed To Checkout",
                style: TextStyle(
                  color: darkgreen,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ));

  
    Widget _buildLoadingWidget() {
      return SpinKitCircle(color: Colors.blue[400]);
    }

    Widget _successWidget() {
      return sharedPreferencesManager.getString("accessToken") == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "You are not logged in!",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 8,
                          color: darkgreen),
                    ),
                    Text(
                      "Login or Sign Up ",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 7,
                          color: darkgreen),
                    ),
                    Text(
                      "to add items to your Cart!",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 7,
                          color: darkgreen),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>WelcomeBackPage(), arguments: {"cartController": cartController, "from": "cart"});
                      },
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 8,
                        width: SizeConfig.safeBlockHorizontal * 40,
                        decoration: BoxDecoration(
                            color: darkgreen,
                            borderRadius: BorderRadius.circular(40.0)),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 7,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              child: cartController.cart == null
                  ? Center(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    )
                  : Container(
                      child: cartController.cart.data.cartproducts.length == 0
                          ? Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: darkgreen,
                                    size: SizeConfig.safeBlockHorizontal * 8,
                                  ),
                                  Text(
                                    "No items in the cart!",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        color: darkgreen),
                                  )
                                ],
                              ),
                          )
                          : LayoutBuilder(
                              builder: (_, constraints) =>
                                  SingleChildScrollView(
                                physics: ClampingScrollPhysics(),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minHeight: constraints.maxHeight),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 32.0, vertical: 15),
                                        height: 125.0,
                                        color: darkgreen,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Subtotal',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  cartController
                                                      .priceTotal.value
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                            checkOutButton
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: Get.height - 200,
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                cartController.cartList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                child: Card(
                                                    margin:
                                                        EdgeInsets.all(10.0),
                                                    child: Container(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  cartController
                                                                      .cartList[
                                                                          index]
                                                                      .product
                                                                      .title
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Text(
                                                                  "Rate: " +
                                                                      "Rs " +
                                                                      cartController
                                                                          .cartList[
                                                                              index]
                                                                          .product
                                                                          .sellingPrice
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Text(
                                                                  "Quantity: " +
                                                                      cartController
                                                                          .cartList[
                                                                              index]
                                                                          .quantity
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Text(
                                                                  "Subtotal: " +
                                                                      (double.parse(cartController.cartList[index].rate) *
                                                                              cartController.cartList[index].quantity)
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Icon(Icons
                                                                  .delete_forever),
                                                            )
                                                          ],
                                                        ))),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
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
          actions: <Widget>[],
          title: Text(
            'Cart',
            style: TextStyle(
                color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        body: Obx(() => cartController.state == ViewState.Busy
            ? _buildLoadingWidget()
            : _successWidget()));
  }
}
