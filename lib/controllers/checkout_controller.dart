
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';

class CheckoutController extends BaseController {
 

  //CartController cartController = CartController();
  ApiProvider apiProvider= ApiProvider();
  List<String> paymentOptions = ['Cash on Delivery', 'Pay via Khalti'];
  var category = "".obs;
  var totalPrice = Get.arguments['total'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  final TextEditingController streeAtddressController = TextEditingController();
  

 

  final count = 0.obs;
  var conditionStatusRadioValue = 0.obs;
  var remarksRadioValue = 0.obs;
  var total = 0.obs;
  var addressTitle = 'Select Payment Option'.obs;
  int cartID = Get.arguments["cartId"];

  Map checkoutMap;
  bool isOrdered = false;

  void checkoutMapping() {
    if (addressTitle.value == "Pay via Khalti") {
    } else {
      checkoutMap = {
        "name": nameController.text.trim(),
        "mobile": numberController.text.trim(),
        "email": emailController.text.trim(),
        "street_address": streeAtddressController.text.trim(),
        "postal_code": postalCode.text.trim(),
        
      };
      print(checkoutMap);
      checkOutOrder(checkoutMap);
    }
  }



  deleteAllProducts() async {
  
  }

  checkOutOrder(map) async {
    setState(ViewState.Busy);
    isOrdered = await apiProvider.checkoutProducts(map);
    if (isOrdered) {
      print("order bhayo hai");
      deleteAllProducts();
      //  cartController.getCart();
      setState(ViewState.Retrieved);

      Get.back();
      Fluttertoast.showToast(
          msg: 'Order placed successfully!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[400],
          textColor: Colors.white);
    } else {
      // Get.back();
      setState(ViewState.Retrieved);
      Fluttertoast.showToast(
          msg: 'Order could not be placed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[400],
          textColor: Colors.white);
    }
  }

  void handleConditionStatusRadioValueChange(int val) {
    conditionStatusRadioValue.value = val;
    update();
    switch (conditionStatusRadioValue.value) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  void handleRemarksRadioValueChange(int val) {
    remarksRadioValue.value = val;
    update();
    switch (remarksRadioValue.value) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    print('arguments: ${Get.arguments}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    checkoutMap.clear();
  }

  void increment() => count.value++;
}
