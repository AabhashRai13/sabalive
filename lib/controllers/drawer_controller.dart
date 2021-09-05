import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

class DrawersController extends BaseController {
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  void logOut() {
    sharedPreferencesManager.clearKey("accessToken");
    sharedPreferencesManager.clearKey("refreshToken");
    sharedPreferencesManager.clearKey("username");
    sharedPreferencesManager.clearKey("isLogin");
    update();
    Get.back();
    Fluttertoast.showToast(
        msg: "You have been logged out.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
