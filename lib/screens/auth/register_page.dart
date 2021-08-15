import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/registration_controller_controller.dart';
import 'package:sabalive/screens/auth/widgets/registration_textfield.dart';

import '../../app_properties.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegistrationControllerController _registrationControllerController =
      Get.put(RegistrationControllerController());
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Glad To Meet You',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Create your new account for future uses.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          if (_key.currentState.validate()) {
            _key.currentState.save();
          }
          _registrationControllerController.mapRegisterInfo();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Register",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              color: Colors.teal[600],
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget registerForm = Container(
      child: Form(
        key: _key,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 28.0, right: 12.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                children: <Widget>[
                  RegistrationTextField(
                    controller:
                        _registrationControllerController.emailController,
                    icon: Icon(Icons.email),
                    hintText: "Email",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Email is Required';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  RegistrationTextField(
                    controller:
                        _registrationControllerController.nameController,
                    icon: Icon(Icons.person),
                    hintText: "Name",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Name is Required';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  RegistrationTextField(
                    controller:
                        _registrationControllerController.passwordController,
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password is Required';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  RegistrationTextField(
                    controller:
                        _registrationControllerController.usernameController,
                    icon: Icon(Icons.person),
                    hintText: "UserName",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'UserName is Required';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  RegistrationTextField(
                    controller:
                        _registrationControllerController.mobileController,
                    icon: Icon(Icons.phone_android),
                    hintText: "Mobile Number",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Mobile is Required';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  RegistrationTextField(
                    controller:
                        _registrationControllerController.cityController,
                    icon: Icon(Icons.location_city),
                    hintText: "City",
                    validator: (String value) {
                      // if(value.isEmpty){
                      //   return 'City is Required';
                      // }
                      // return null;
                    },
                    obscureText: false,
                  ),
                  RegistrationTextField(
                    controller: _registrationControllerController
                        .streetAddressController,
                    icon: Icon(Icons.location_on),
                    hintText: "Street Address",
                    validator: (String value) {
                      // if(value.isEmpty){
                      //   return 'Street Address is Required';
                      // }
                      // return null;
                    },
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  registerButton,
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget socialRegister = Column(
      children: <Widget>[
        Text(
          'You can sign in with',
          style: TextStyle(
              fontSize: 12.0, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.find_replace),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
                icon: Icon(Icons.find_replace),
                onPressed: () {},
                color: Colors.white),
          ],
        )
      ],
    );

    alertbox() {
      return AlertDialog(
        title: Text("Make a Choice"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Pick From Gallery'),
              onTap: () {
                Get.back();
                _registrationControllerController.pickFromGallery();
              },
            ),
            ListTile(
              title: Text('Take a Picture'),
              onTap: () {
                Get.back();
                _registrationControllerController.pickFromCamera();
              },
            ),
          ],
        ),
      );
    }

    Widget imageHolder = Center(
      child: InkWell(
        onTap: () {
          Get.dialog(alertbox(),
              barrierColor: Colors.teal.withOpacity(0.2),
              barrierDismissible: true);
        },
        child: GetBuilder<RegistrationControllerController>(
          builder: (_registrationControllerController) => Container(
              padding: EdgeInsets.all(15),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: _registrationControllerController.image ==
                            null
                        ? AssetImage("assets/SabaLive.png")
                        : FileImage(_registrationControllerController.image),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(child: Icon(Icons.edit)))
                ],
              )),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: lightgreen,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    title,
                    subTitle,
                    imageHolder,
                    registerForm,
                    Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: socialRegister)
                  ],
                ),
              ),
            ),
            Positioned(
              left: 5,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
