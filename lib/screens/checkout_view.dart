
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  final SharedPreferencesManager sharedPreferencesManager =
    locator<SharedPreferencesManager>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: Scaffold(
            body: Obx(() => checkoutController.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget(context))),
      ),
    );
  }

  Widget _buildSuccessWidget(context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  iconSize: 18,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop()),
              Text(
                'Checkout Page',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Confirm your order'),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose Payment Option',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 2,
                    child: ExpansionTile(
                      collapsedBackgroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      leading: Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.blue,
                      ),
                      title: Text(checkoutController.addressTitle.value),
                      children: List.generate(
                        checkoutController.paymentOptions.length,
                        (index) {
                          return Column(
                            children: [
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                    onPressed: () {
                                      checkoutController.addressTitle.value =
                                          checkoutController
                                              .paymentOptions[index];
                                    },
                                    child: Text(
                                      checkoutController.paymentOptions[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Username:',
                            ),
                          ),
                         
                           input(
                              Icon(Icons.person,
                                  color: Colors.blue, size: 18),
                              "Username",
                              checkoutController.nameController
                                ..text = sharedPreferencesManager.getString("username"),
                              false,
                              TextInputType.text,
                              1),
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Email:',
                            ),
                          ),
                         
                          inputEmailCheckout(
                              Icon(
                                Icons.email_outlined,
                                color: Colors.blue,
                                size: 18,
                              ),
                              'Email',
                              checkoutController.emailController,
                              false,
                              TextInputType.emailAddress,
                              1),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Contact Number:'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  offset: Offset(0, 0),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Contact number cannot be empty';
                                }
                                if (value.length != 10) {
                                  return 'Contact number must be of 10 digits!';
                                } else
                                  return null;
                              },
                              controller: checkoutController.numberController
                                ..text = 
                                                        sharedPreferencesManager.getString("mobile"),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Contact Number',
                                hintText: 'Contact Number',
                                filled: true,
                                fillColor: Colors.white,
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.phone_android_outlined,
                                    color: Colors.blue, size: 18),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Street Addres:'),
                          ),
                          input(
                              Icon(Icons.place_outlined,
                                  color: Colors.blue, size: 18),
                              "Address",
                              checkoutController.streeAtddressController
                                ..text = sharedPreferencesManager.getString("streetAddress"),
                              false,
                              TextInputType.text,
                              1),
                       
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Postal code:'),
                          ),
                          input(
                              Icon(Icons.place_outlined,
                                  color: Colors.blue, size: 18),
                              "Postal code",
                              checkoutController.postalCode
                                ..text = sharedPreferencesManager.getString("postalCode"),
                              false,
                              TextInputType.text,
                              1),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 100,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.3),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        onPressed: () {
                          if (checkoutController.addressTitle.value !=
                              'Select Payment Option') {
                            if (_formKey.currentState.validate()) {
                              checkoutController.checkoutMapping();
                            }
                          } else
                            Fluttertoast.showToast(
                                msg: 'Please select payment option!',
                                backgroundColor: Colors.blue[400],
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP);
                        },
                        color: Colors.white,
                        child: Text(
                          'Place Order',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: SpinKitCircle(
      color: Colors.blue,
    ));
  }

  Widget input(
  Icon icon,
  String hint,
  TextEditingController textEditingController,
  bool obsecure,
  TextInputType textInputType,
  int lines,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(60),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          offset: Offset(0, 0),
          spreadRadius: 1,
          blurRadius: 4,
        )
      ],
    ),
    child: TextFormField(
      maxLines: lines,
      keyboardType: textInputType,
      obscureText: obsecure,
      validator: (value) {
        if (value.isEmpty) {
          return '$hint cannot be empty';
        } else
          return null;
      },
      controller: textEditingController,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        suffixIcon: icon,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: hint,
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}


  Widget inputEmailCheckout(
    Icon icon,
    String hint,
    TextEditingController textEditingController,
    bool obsecure,
    TextInputType textInputType,
    int lines,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(0, 0),
            spreadRadius: 2,
            blurRadius: 4,
          )
        ],
      ),
      child: TextFormField(
        maxLines: lines,
        keyboardType: textInputType,
        obscureText: obsecure,
        validator: (value) {
          if (value.isEmail == null || value.isEmpty) {
            return 'email empty';
          }

          const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
          final regExp = RegExp(pattern);

          if (!regExp.hasMatch(value)) {
            return 'Invalid email address';
          }
          return null;
        },
        controller: textEditingController
          ..text = sharedPreferencesManager.getString("email") == null
              ? ''
              : sharedPreferencesManager.getString("email")
          
              ,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          suffixIcon: icon,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: hint,
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
