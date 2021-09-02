import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../app_properties.dart';

class ProductDetailAppbar extends StatelessWidget {
  ProductDetailAppbar({
    Key key,
  }) : super(key: key);

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
                      onRatingUpdate: (rating) {
                      
                      },
                    ),
                  ],
                )))));
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(CupertinoIcons.back)),
        ),
      ),
      iconTheme: IconThemeData(color: darkGrey),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              rating();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
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
    );
  }
}
