import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/models/blog_model.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage({Key key, @required this.datum}) : super(key: key);
  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgreen.withOpacity(1),
      body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                   onTap: (){
                     Get.back();
                   },
                   child: Icon(CupertinoIcons.back),
                 ),
                 
               ],
             ),
              SizedBox(height: 15.0,),
              
              Text("Online Shopping".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600),),
              SizedBox(height: 10.0,),
              Text(datum.title.capitalizeFirst,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              SizedBox(height: 15.0,),
              AspectRatio(aspectRatio: 1.25,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        datum.image
                      )
                    )
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Text(datum.content)
            ],
        ),
      ),
          )),
    );
  }
}
