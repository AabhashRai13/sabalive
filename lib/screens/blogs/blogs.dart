import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Blogs",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Leave us a message, We will get contact with you as soon as possible.",
                style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              
            ],
          ),
        ),
      ),
    );
  }
}
