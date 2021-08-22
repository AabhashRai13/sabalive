import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/screens/about_us/about_us.dart';
import 'package:sabalive/screens/about_us/contact_us.dart';
import 'package:sabalive/screens/auth/register_page.dart';
import 'package:sabalive/screens/auth/welcome_back_page.dart';
import 'package:sabalive/screens/blogs/blogs.dart';
import 'package:sabalive/screens/profile_page.dart';

Widget drawer(){
  return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
            onTap: (){
              Get.to(ProfilePage());
            },
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: lightgreen
                ),
                  
                  child: CircleAvatar(
                    child: Text("Profile"),
                  )
              ),
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
              leading: new Icon(Icons.chat),
              title: const Text("Blogs"),
              onTap: (){
                Get.to(Blogs());
              },
            ),
            Divider(),
            ListTile(
              leading: new Icon(Icons.local_offer),
              title: const Text("Special Offers"),
              onTap: (){
                Get.to(Blogs());
              },
            ),
            Divider(),
            ListTile(
  leading: new Icon(Icons.call),
          title: const Text("Contact Us"),
          onTap: (){
    Get.to(ContactUs());
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