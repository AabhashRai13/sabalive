import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/bindings/bindings.dart';
import 'package:sabalive/controllers/drawer_controller.dart';
import 'package:sabalive/controllers/profile_controller.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/screens/about_us/about_us.dart';
import 'package:sabalive/screens/about_us/contact_us.dart';
import 'package:sabalive/screens/auth/welcome_back_page.dart';
import 'package:sabalive/screens/blogs/blogs.dart';
import 'package:sabalive/screens/order_page_view.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

import '../../profile_update/profile_update.dart';

final SharedPreferencesManager sharedPreferencesManager =
    locator<SharedPreferencesManager>();

Widget drawer(BuildContext context) {
  return SafeArea(
      child: GetBuilder<DrawersController>(
          init: DrawersController(),
          builder: (value) => Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: lightgreen),
                      child: sharedPreferencesManager.getString("accessToken")==null
                          ?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            minRadius: 50.0,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("User not Login"),
                        ],
                      ):GetBuilder<ProfileController>(
                        init: ProfileController(),
                          builder: (value) => value.profileModel == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      minRadius: 50.0,
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      minRadius: 50.0,
                                      backgroundImage: NetworkImage(
                                          value.profileModel.message.image),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                        value.profileModel.message.name.capitalize)
                                  ],
                                )),
                    ),
                    sharedPreferencesManager.getBool("isLogin") == null
                        ? ListTile(
                            leading: new Icon(Icons.login),
                            title: const Text("Login"),
                            onTap: () {
                              Get.to(() => WelcomeBackPage());
                            },
                          )
                        : Container(),
                    sharedPreferencesManager.getBool("isLogin") != null
                        ? Column(
                      children: [
                        ListTile(
                          leading: new Icon(Icons.person),
                          title: const Text("Update Profile"),
                          onTap: () {
                            Get.to(()=>ProfileUpdate());
                          },
                        ),
                        Divider()
                      ],
                    )
                        : Container(),
                        sharedPreferencesManager.getBool("isLogin") != null
                        ? ListTile(
                            leading: new Icon(Icons.login),
                            title: const Text("Order History"),
                            onTap: () {
                              Get.back();
                              Get.to(() => OrderPageView());

                            },
                          )
                        : Container(),
                    Divider(),
                    ListTile(
                      leading: new Icon(Icons.chat),
                      title: const Text("Blogs"),
                      onTap: () {
                        Get.to(()=>Blogs(), binding: BlogBindings());
                      },
                    ),
                    Divider(),
                
                    ListTile(
                      leading: new Icon(Icons.call),
                      title: const Text("Contact Us"),
                      onTap: () {
                        Get.to(()=>ContactUs());
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: new Icon(Icons.group),
                      title: const Text("About Us"),
                      onTap: () {
                        Get.back();
                        Get.to(()=>AboutUs(), binding: AboutUsBindings());
                      },
                    ),
                    Divider(),
                    sharedPreferencesManager.getBool("isLogin") == null
                        ? Container()
                        : Column(
                            children: [
                              ListTile(
                                leading: new Icon(Icons.logout),
                                title: const Text("Log Out"),
                                onTap: () {
                                  Get.back();
                                  _logoutAlertDialog(context, value);
                                },
                              ),
                              Divider(),
                            ],
                          ),
                  ],
                ),
              )));
}

Future<void> _logoutAlertDialog(BuildContext context, value) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              value.logOut();
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
