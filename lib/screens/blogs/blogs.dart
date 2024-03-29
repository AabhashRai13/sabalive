import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/blog_controller.dart';
import 'package:sabalive/controllers/profile_controller.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/screens/blogs/blog_detailpage.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

class Blogs extends StatelessWidget {
  Blogs({Key key}) : super(key: key);
 final BlogController blogController = Get.put(BlogController());
  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.blue[400]);
  }

  Widget _successWidget() {
    return blogController.blogs==null
        ? Center(
            child: Text(
              "No Data Found",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          )
        : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sharedPreferencesManager
                      .getString("accessToken") ==
                      null
                      ? Container()
                      : GetBuilder<ProfileController>(
                      init: ProfileController(),
                      builder: (value) => value.profileModel == null
                          ? Container()
                          :  Text(value.profileModel.message.name.capitalize,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                 
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your daily read",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                          height: Get.height,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: blogController.blogs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.to(BlogDetailPage(datum: blogController.blogs[index],));
                                    },
                                    child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Image(
                                                    image: NetworkImage(
                                                        blogController
                                                            .blogs[index].image))),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${blogController.blogs[index].title}",
                                                          style: TextStyle(
                                                              color: Colors.grey[400]),
                                                        ),
                                                        GestureDetector(
                                                          onTap: (){
                                                          },
                                                          child: Icon(Icons.more_horiz,color: Colors.grey[400],),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${blogController.blogs[index].content}",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 15.0,),
                                                    Text("Store Id: ${blogController.blogs[index].store}",style: TextStyle(color: Colors.black),),
                                                    SizedBox(height: 5.0,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("April 24, 2020",style: TextStyle(color: Colors.grey[400]),),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "${blogController.blogs[index].views.toString()}"),
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Icon(Icons.visibility)
                                                          ],
                                                        )
                                                        
                                                      ],
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        )),
                                  ),
                                );
                              }))
                ],
              ),
            ),
          );
  }


  final SharedPreferencesManager sharedPreferencesManager =
  locator<SharedPreferencesManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      body: Obx(() => blogController.state == ViewState.Busy
          ? _buildLoadingWidget()
          : _successWidget()),
    );
  }
}
