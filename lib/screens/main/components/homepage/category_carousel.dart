import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';
import 'package:sabalive/screens/main/components/homepage/category_detail_page.dart';

class CategoryCarousel extends StatelessWidget {
  CategoryCarousel({Key key,
    @required this.homeController}) : super(key: key);
  
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: homeController.categoryLists == null
                ? Text("loading...")
                : Text("Category",
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                )),
          ),
          Container(
            height: 100,
            child: homeController.categoryLists.length != null
                ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeController.categoryLists.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            
                            homeController.assignCategoryId(categoryId: homeController.categoryLists[index].id);
                            Get.to(()=>CategoryDetailPage(title: homeController.categoryLists[index].title,categoryId: homeController.categoryLists[index].id));
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(homeController.categoryLists[index].image,),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(homeController.categoryLists[index].title)
                      ],
                    )
                   
                  ),
                );
              },
            )
                : Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
