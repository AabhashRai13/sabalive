import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/category_detail_controller.dart';

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
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount:categoryDetailController.categoryDetail.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation ==
                Orientation.landscape ? 3: 2,
            childAspectRatio: (1/ 1.2),
          ),
          itemBuilder: (context,index,) {
            return Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      categoryDetailController.categoryDetail[index].displayImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              categoryDetailController.categoryDetail[index].title,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.price_change,
                                  size: 10.0,
                                  color: Colors.black87,
                                ),
                                SizedBox(width: 2.0),
                                Flexible(
                                  child: Text(
                                    categoryDetailController.categoryDetail[index].markedPrice,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.5),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.price_change,
                                  size: 10.0,
                                  color: Colors.black54,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  categoryDetailController.categoryDetail[index].sellingPrice,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
              
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text(title.capitalize,style: TextStyle(color: Colors.black),),
      ),
      body: Obx(()=>categoryDetailController.state == ViewState.Busy
          ? _buildLoadingWidget()
          : _buildSuccessWidget(context))
    );
  }
}
