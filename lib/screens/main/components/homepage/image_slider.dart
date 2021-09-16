import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key key, this.homeController}) : super(key: key);
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: homeController.sliderProductModel == null
                  ? Text("Loading...")
                  : Text("Favourite Product",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      )),
            ),
            Container(
              child: homeController.sliderLists.length != null
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: homeController.sliderLists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(homeController
                                        .sliderLists[index].image),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      homeController.sliderLists[index].title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      homeController.sliderLists[index].content,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ));
  }
}
