import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/forget_password_response.dart';

class ForgotPasswordController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey prefixKey = GlobalKey();
  final double prefixWidth = 0;
  ForgetPassword forgetPassword;

  void enterEmail() {
    Map map = {"email": emailController.text.trim()};
    resetPassword(map: map);
  }

  void resetPassword({Map map}) async {
    setState(ViewState.Busy);
    forgetPassword = await _apiProvider.requestPasswordChange(map);
    if (forgetPassword.status == "success") {
      Fluttertoast.showToast(
          msg: forgetPassword.message, textColor: Colors.white);
    }
    setState(ViewState.Busy);
  }

  @override
  void onClose() {
    emailController.clear();
    super.onClose();
  }
}
