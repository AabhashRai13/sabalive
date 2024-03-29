import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/controllers/cart_controller.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/registration_model.dart';
import 'package:sabalive/models/token.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

class LoginPageController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  TextEditingController loginNameController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  var busy = false.obs;
  final count = 0.obs;
  Token token;
  RegistrationResponse registrationResponse;
  ApiProvider apiAuthProvider = ApiProvider();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  final formKey = GlobalKey<FormState>();
  bool autovalidate = false;
  final CartController _cartController = Get.arguments["cartController"];
  String _from = Get.arguments["from"];
  void updateState() {
    autovalidate = true;
  }

  @override
  void onInit() {
    super.onInit();
    print("from $_from");
  }

  void loginUser(Map map) async {
    busy.value = true;
    token = await apiAuthProvider.loginUser(map);

    if (token == null) {
      busy.value = false;
      Fluttertoast.showToast(
          msg: "Check your credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[300],
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      busy.value = false;

      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyAccessToken, token.access);
      print("access token ${token.access}");
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyRefreshToken, token.refresh);
      print("refresh token ${token.refresh}");
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.mobile, token.mobile);

      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyUsername, token.name);
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.email, token.email);
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.streetAddress, token.streetAddress ?? "");
      await sharedPreferencesManager.putBool(
          SharedPreferencesManager.keyIsLogin, true);

      _from == "cart" ? _cartController.fetchCart() : print("not from cart");

      Get.back();
    }
    busy.value = false;
  }

  void mapInputsLogin() {
    if (loginNameController.text.isEmpty ||
        loginPasswordController.text.isEmpty) {
    } else {
      Map map = {
        "email": loginNameController.text.trim(),
        "password": loginPasswordController.text.trim()
      };
      loginUser(map);
    }
  }

  @override
  void onClose() {
    super.onClose();
    loginNameController.clear();
    emailController.clear();
    passwordController.clear();
    registerNameController.clear();
    loginPasswordController.clear();
  }
}
