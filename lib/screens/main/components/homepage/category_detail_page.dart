import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/category_detail_controller.dart';
import 'package:sabalive/screens/product/product_detail_page.dart';
import 'package:sabalive/utils/sizeConfig.dart';

class CategoryDetailPage extends StatelessWidget {
  CategoryDetailPage({Key key, @required this.categoryId, @required this.title}) : super(key: key);

  final int categoryId;
  final String title;
  final CategoryDetailController categoryDetailController=Get.put(CategoryDetailController());

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.blue[400]);
  }
  
  Widget _buildSuccessWidget(BuildContext context){
    return categoryDetailController.categoryDetail == null
        ? Center(
      child: Text(
        "No Data Found",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    )
        : Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return GridView.builder(
                itemCount: categoryDetailController.categoryDetail.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  childAspectRatio: (orientation == Orientation.portrait)
                      ? MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / SizeConfig.blockSizeVertical*5)
                      : MediaQuery.of(context).size.width / 900.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>ProductPage(
                          productId: categoryDetailController.categoryDetail[index].id,
                        ));
                      },
                      child: Container(
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                categoryDetailController.categoryDetail[index].displayImage),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(14.0,0,0,0),
                                      child: Text(
                                        categoryDetailController.categoryDetail[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.safeBlockHorizontal*6),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(14.0,0,0,0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.money_off_csred_outlined,
                                            color: Colors.black87,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            categoryDetailController.categoryDetail[index].markedPrice,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: SizeConfig.safeBlockHorizontal*4
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(14.0,0,0,0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.attach_money,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            categoryDetailController.categoryDetail[index].sellingPrice,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: SizeConfig.safeBlockHorizontal*4
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                },
              );
            },
          ),
        );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(CupertinoIcons.back),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black,size: SizeConfig.safeBlockHorizontal*7),
        elevation: 0.0,
        title: Text(title.capitalize,style: TextStyle(color: Colors.black,
        fontSize: SizeConfig.safeBlockHorizontal*7),),
      ),
      body: Obx(()=>
      categoryDetailController.state == ViewState.Busy
          ? _buildLoadingWidget()
          : _buildSuccessWidget(context)

      ));
  }
}