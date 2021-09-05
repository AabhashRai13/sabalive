
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/constants/global_variables.dart';
import 'package:sabalive/models/contact_us_model.dart';

class ContactUsController extends BaseController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  ApiProvider apiAuthProvider = ApiProvider();
  ContactUs contactUs;
  var textState = false.obs;


  Future<ContactUs> contactStore(Map map) async{
    setState(ViewState.Busy);
    contactUs=  await apiAuthProvider.contact(map);
    setState(ViewState.Retrieved);
    if (contactUs != null) {
      textState.value = true;
      Get.back();
      Fluttertoast.showToast(
          msg: 'Message Send Successfully!',
          backgroundColor: Colors.blue[400],
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP);
      onClose();
    }
    return null;
  }
  
  void mapContactInputs() {
      Map map = {
        "sender": nameController.text,
        "email": emailController.text,
        "subject": subjectController.text,
        "content": contentController.text,
        "store": GlobalVariables.storeId,
      };
      
      contactStore(map);
  }


  @override
  void onClose() {
    super.onClose();
    nameController.clear();
    emailController.clear();
    subjectController.clear();
    contentController.clear();
  }
  
}