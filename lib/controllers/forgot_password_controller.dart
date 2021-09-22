import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/forget_password_response.dart';

class ForgotPasswordController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  final GlobalKey prefixKey = GlobalKey();
  final double prefixWidth = 0;
  ForgetPassword forgetPassword;

  void enterEmail() {
    Map map = {"email": emailController.text.trim()};
    resetPassword(map: map);
  }

  void resetPassword({Map map}) async {
    setState(ViewState.Busy);
    forgetPassword = await _apiProvider.requestPasswordforget(map);
    if (forgetPassword.status == "success") {
      Fluttertoast.showToast(
          msg: forgetPassword.message, textColor: Colors.white);
    }
    setState(ViewState.Busy);
  }

void mapNewPassword(){


  
  Map map = {"old_password": oldPasswordController.text.trim(),
  "new_password": newPasswordController.text.trim(),
  "confirm_new_password": confirmNewPasswordController.text.trim()
  };
  changePassword(map: map);
}

    void changePassword({Map map}) async {
    setState(ViewState.Busy);
  bool success   = await _apiProvider.requestPasswordChange(map);
    if (success) {
      Fluttertoast.showToast(
          msg: "Your password is successfully changed", textColor: Colors.white);
    }else{
       Fluttertoast.showToast(
          msg: "Your password couldn't be changed", textColor: Colors.white);
    }
    setState(ViewState.Busy);
  }

  @override
  void onClose() {
    emailController.clear();
    super.onClose();
  }
}
