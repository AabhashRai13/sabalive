import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/controllers/about_us_controller.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key key}) : super(key: key);
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.blue[400]);
  }

  Widget _successWidget() {
    return aboutUsController.aboutUs.data == null
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
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About us",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Know more about us",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Image.asset("assets/SabaLive.png"),
                  SizedBox(height: 10),
                  Text(
                      "Welcome to ${aboutUsController.aboutUs.data.storeName}. Here you can get all types of fresh meat as you wanted in affordable price. Hope you like it."),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text(
                        "Call us (${aboutUsController.aboutUs.data.contact})"),
                    leading: Icon(Icons.call),
                    onTap: () {
                      aboutUsController.customLaunch(
                          'tel: ${aboutUsController.aboutUs.data.contact}');
                    },
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text("Message Us"),
                    leading: Icon(Icons.message),
                    onTap: () {
                      aboutUsController.customLaunch(
                          'sms: ${aboutUsController.aboutUs.data.contact}');
                    },
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text("Mail Us"),
                    leading: Icon(Icons.mail),
                    onTap: () {
                      aboutUsController.customLaunch(
                          'mailto: ${aboutUsController.aboutUs.data.email}');
                    },
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          );
  }

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
      ),
      body: GetBuilder<AboutUsController>(
          builder: (value) => aboutUsController.state == ViewState.Busy
              ? _buildLoadingWidget()
              : _successWidget()),
    );
  }
}
