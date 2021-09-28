import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/profile_controller.dart';
import 'package:sabalive/controllers/update_profile_controller.dart';
import 'package:sabalive/screens/profile_update/profile_update_textfield.dart';

import '../../../app_properties.dart';

class ProfileUpdate extends StatelessWidget {
  ProfileUpdate({Key key}) : super(key: key);
  
  final ProfileController profileController= Get.put(ProfileController());
  final UpdateProfileController updateProfileController= Get.put(UpdateProfileController());
  final GlobalKey<FormState> _key = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    
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
                  
                  ProfileUpdateTextField(
                    
                    controller:
                    updateProfileController.nameController,
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
                  
                  ProfileUpdateTextField(
                    
                    controller:
                    updateProfileController.mobileController,
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
                  ProfileUpdateTextField(
                    
                    controller:
                    updateProfileController.cityController,
                    icon: Icon(Icons.location_city),
                    hintText: "City",
                    validator: (String value) {
                    
                    },
                    obscureText: false,
                  ),
                  ProfileUpdateTextField(
                    controller: updateProfileController
                        .streetAddressController,
                    icon: Icon(Icons.location_on),
                    hintText: "Street Address",
                    validator: (String value) {
                    },
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                      }
                      updateProfileController.mapRegisterInfo();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 80,
                      child: Center(
                          child: new Text("Update",
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
                updateProfileController.pickFromGallery();
              },
            ),
            ListTile(
              title: Text('Take a Picture'),
              onTap: () {
                Get.back();
                updateProfileController.pickFromCamera();
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
        child: GetBuilder<UpdateProfileController>(
          builder: (updateProfileController) => Container(
              padding: EdgeInsets.all(15),
              child: Stack(
                children: [
                  GetBuilder<ProfileController>(builder: (profileController)=> CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: updateProfileController.image ==
                        null
                        ? profileController.profileModel==null?AssetImage("assets/SabaLive.png"):NetworkImage(profileController.profileModel.message.image)
                        : FileImage(updateProfileController.image),
                  ),),
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
      appBar: AppBar(
        
        backgroundColor: lightgreen,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        title: Text(
          'Update Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              shadows: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ]),
        ),),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: lightgreen,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    imageHolder,
                    registerForm,
                  
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}