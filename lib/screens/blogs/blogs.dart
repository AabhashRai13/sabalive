import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/blog_controller.dart';

class Blogs extends StatelessWidget {
  Blogs({Key key}) : super(key: key);

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.blue[400]);
  }

  Widget _successWidget() {
    return blogController.blogs == null
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
                  Text(
                    "Hello Everyone, hope you are having a wonderful day.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Your daily read"),
                  SizedBox(
                    height: 20,
                  ),
                  blogController.blogs == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: Get.height,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: blogController.blogs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.all(8.0),
                                    height: Get.height / 6,
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
                                                Text(
                                                  "${blogController.blogs[index].title}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "${blogController.blogs[index].content}",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Spacer(),
                                                Center(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          "${blogController.blogs[index].views.toString()}"),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Icon(Icons.visibility)
                                                    ],
                                                  ),
                                                ),
                                                Divider()
                                              ],
                                            ))
                                      ],
                                    ));
                              }))
                ],
              ),
            ),
          );
  }

  BlogController blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
