import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/screens/about_us/about_us.dart';
import 'package:sabalive/screens/auth/register_page.dart';
import 'package:sabalive/screens/auth/welcome_back_page.dart';

Widget drawer(){
  return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: lightgreen
              ),
                child: Text("Drawer Header")
            ),
            
            ListTile(
              leading: new Icon(Icons.login),
              title: const Text("Login"),
              onTap: (){
                Get.to(WelcomeBackPage());
              },
            ),
            Divider(),
            ListTile(
              leading: new Icon(CupertinoIcons.person_add),
              title: const Text("Create New account"),
              onTap: (){
                Get.to(RegisterPage());
              },
            ),
            Divider(),
        ListTile(
  leading: new Icon(Icons.call),
          title: const Text("Contact Us"),
          onTap: (){
          },
        ),
  
            Divider(),
            ListTile(
              leading: new Icon(Icons.group),
              title: const Text("About Us"),
              onTap: (){
                Get.to(AboutUs());
              },
            ),
            Divider(),
          ],
        ),
      )
  );
}