import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/registration_model.dart';
import 'package:sabalive/models/token.dart';
import 'package:sabalive/screens/main/main_page.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

class LoginPageController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  TextEditingController loginNameController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  var busy = "".obs;
  final count = 0.obs;
  Token token;
  RegistrationResponse registrationResponse;
  ApiProvider apiAuthProvider = ApiProvider();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  final formKey = GlobalKey<FormState>();
  bool autovalidate = false;

  void updateState() {
    autovalidate = true;
  }

  void loginUser(Map map) async {
    setState(ViewState.Busy);
    token = await apiAuthProvider.loginUser(map);
    print("acces token ${token.access}");
    if (token == null) {
      Fluttertoast.showToast(
          msg: "Check your credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[300],
          textColor: Colors.white,
          fontSize: 16.0);
      setState(ViewState.Retrieved);
    } else {
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyAccessToken, token.access);
      print("access token ${token.access}");
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyRefreshToken, token.refresh);
      print("refresh token ${token.refresh}");

      await sharedPreferencesManager.putBool(
          SharedPreferencesManager.keyIsLogin, true);

      Get.offAll(() => MainPage());

      setState(ViewState.Retrieved);
    }
  }

  void mapInputsLogin() {
    Map map = {
      "email": loginNameController.text.trim(),
      "password": loginPasswordController.text.trim()
    };
    loginUser(map);
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
