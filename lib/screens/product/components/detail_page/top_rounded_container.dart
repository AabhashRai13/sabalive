import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/controllers/add_to_cart_controller.dart';
import 'package:sabalive/controllers/counter_controller.dart';
import 'package:sabalive/controllers/variant_button_controller.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/screens/product/components/detail_page/related_product_container.dart';
import 'package:sabalive/screens/product/components/detail_page/variant_button.dart';

class TopRoundedContainer extends StatelessWidget {
  TopRoundedContainer({
    Key key,
    this.product,
  }) : super(key: key);
  final ProductDetails product;
  final AddToCartController addToCartController =
      Get.put(AddToCartController());
  final CounterController counterController = Get.put(CounterController());
  final VariantButtonController variantButtonController =
      Get.put(VariantButtonController());

  rating() {
    return Get.bottomSheet(BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
            height: 100,
            padding: EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Rate this"),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                )))));
  }

  Row addRadioButton(int btnIndex, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<VariantButtonController>(
            builder: (_) => VariantButton(
                value: variantButtonController.variant[btnIndex],
                groupValue: variantButtonController.select,
                onChanged: (value) =>
                    variantButtonController.onClickRadioButton(value),
                leading: title)),
      ],
    );
  }

  Widget addToCartWidget() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: Get.width / 2,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    counterController.decrement();
                  },
                  child: Icon(Icons.remove),
                ),
                Obx(
                  () => Text(
                    '${counterController.count}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    counterController.increment();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              addToCartController.addToCart(
                  productID: product.data.id,
                  productQuantiity: counterController.count);
            },
            child: Container(
              height: 50,
              width: Get.width / 5,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: mainButtonColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue),
              ),
              child: Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.grey[200],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.data.title.capitalize,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        product.data.store.storeName.capitalize,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Marked Price: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Rs ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            TextSpan(
                                text: product.data.markedPrice,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))
                          ])),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Selling Price: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Rs ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            TextSpan(
                                text: product.data.sellingPrice,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))
                          ])),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    rating();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      children: [
                        Text(
                          "4.5",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          addToCartWidget(),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                addRadioButton(0, "100 gm"),
                addRadioButton(1, "200 gm"),
                addRadioButton(2, "500 gm"),
                addRadioButton(3, "1000 gm"),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    product.data.description,
                    maxLines: 6,
                  ),
                ],
              )),
          product.relatedProducts.length == 0
              ? Container()
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Text("Related Product",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        )),
                  ),
                  Container(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.relatedProducts.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          RelatedProducts relatedproduct =
                              product.relatedProducts[index];
                          return RelatedProductContainer(
                            product: relatedproduct,
                          );
                        },
                      ))
                ],
              ),
        ],
      ),
    );
  }
}
