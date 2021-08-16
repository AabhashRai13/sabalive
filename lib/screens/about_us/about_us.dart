import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
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
      body: SingleChildScrollView(
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
              Text("Welcome to SabaLive. Here you can get all types of fresh meat as you wanted in affordable price. Hope you like it."),
              SizedBox(height: 10.0,),
              Divider(
                height: 2,
                color: Colors.black,
              ),
              ListTile(
                title: Text("Call us (+8001111111111)" ),
                leading: Icon(Icons.call),
                onTap: () {
                  customLaunch('tel: 9860168588');
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
                  customLaunch('sms: 9860168588');
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
                  customLaunch('mailto: sujanlamichhane742@gmail.com');
                },
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
