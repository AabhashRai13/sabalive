import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sabalive/controllers/payment_list_controller.dart';
import 'package:sabalive/models/payment_list_model.dart';

class CheckoutController extends BaseController {
  final PaymentListController _paymentListController =
      Get.put(PaymentListController());
  ApiProvider apiProvider = ApiProvider();
  PaymentListModel paymentListModel;
  List<String> paymentOptions = [];
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
      print({
        "name": nameController.text.trim(),
        "mobile": numberController.text.trim(),
        "email": emailController.text.trim(),
        "street_address": streeAtddressController.text.trim(),
        "postal_code": postalCode.text.trim(),
      });

      var formData = dio.FormData.fromMap({
        "name": nameController.text.trim(),
        "mobile": numberController.text.trim(),
        "email": emailController.text.trim(),
        "street_address": streeAtddressController.text.trim(),
        "postal_code": postalCode.text.trim(),
      });
      print(formData.length);
      checkOutOrder(formData);
    }
  }

  deleteAllProducts() async {}

  checkOutOrder(map) async {
    setState(ViewState.Busy);
    isOrdered = await apiProvider.checkoutProducts(map, cartID);
    if (isOrdered) {
      print("order bhayo hai");
      deleteAllProducts();
      //  cartController.getCart();
      setState(ViewState.Retrieved);

      Get.back();
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

  void fetchPaymentList() async {
    paymentListModel = await _paymentListController.fetPaymentList();
    if (paymentListModel != null) {
      for (int i = 0; i < paymentListModel.data.length; i++) {
        paymentOptions.add(paymentListModel.data[i].title);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    print('arguments: ${Get.arguments}');
    fetchPaymentList();
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
