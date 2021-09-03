import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/add_to_cart_controller.dart';
import 'package:sabalive/models/product_detail_model.dart';

class TopRoundedContainer extends StatelessWidget {
  TopRoundedContainer({
    Key key,
    this.product,
  }) : super(key: key);
  final ProductDetails product;
  final AddToCartController addToCartController =
      Get.put(AddToCartController());

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
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
                          product.data.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0,),
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
                        SizedBox(height: 5.0,),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
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
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, right: width * 0.3),
              child: Text(
                product.data.description,
                maxLines: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
