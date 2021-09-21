import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';
import 'package:sabalive/screens/product/product_detail_page.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key key, this.homeController}) : super(key: key);
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: homeController.sliderProductModel == null
                    ? Text("Loading...")
                    : Text("Popular Product",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        )),
              ),
              Container(
                child: homeController.sliderLists.length != null
                    ? Container(height: 150,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: homeController.sliderLists.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(() => ProductPage(
                          productId: homeController.sliderLists[index].id,
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(homeController
                                        .sliderLists[index].image),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),)
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
    ));
  }
}
