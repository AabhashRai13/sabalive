import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sabalive/models/registration_model.dart';
import '../../../base model/base_model.dart';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart' as dio;

import '../../../constants/enum.dart';

class RegistrationControllerController extends BaseController {
  File image;
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController imageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final TextEditingController streetAddressController = TextEditingController();

  RegistrationResponse registrationResponse;
  ApiProvider apiAuthProvider = ApiProvider();
  var textState = false.obs;

  var selectedDate = "YY/MM/DD HR:SEC".obs;
  var selectedDateTextView = "YY/MM/DD HR:SEC".obs;

  String convertedDateTime =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";

  Future<void> pickFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print(convertedDateTime);
  }

  //to get a target path to provide for compressed file location
  Future<String> targetPath() async {
    final directory = await getApplicationDocumentsDirectory();
    String targetPath = directory.path + "/" + basename(image.path);
    print("Target Path $targetPath");
    return targetPath;
  }

  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 60,
    );

    return result;
  }

  void mapRegisterInfo() async {
    if (image != null) {
      File compressedImage =
          await testCompressAndGetFile(image, await targetPath());
      var formData = dio.FormData.fromMap({
        "username": usernameController.text.trim(),
        "password": passwordController.text.trim(),
        "name": nameController.text.trim(),
        "image": await dio.MultipartFile.fromFile(compressedImage.path),
        "mobile": mobileController.text.trim(),
        "city": cityController.text.trim(),
        "street_address": streetAddressController.text.trim()
      });
      registerUser(formData);
    } else {
      var formData = dio.FormData.fromMap({
        "username": usernameController.text.trim(),
        "password": passwordController.text.trim(),
        "name": nameController.text.trim(),
        "image": null,
        "mobile": mobileController.text.trim(),
        "city": cityController.text.trim(),
        "street_address": streetAddressController.text.trim()
      });
      registerUser(formData);
    }
  }

  Future registerUser(myProductCreateMap) async {
    setState(ViewState.Busy);
    registrationResponse =
        await apiAuthProvider.registerUser(myProductCreateMap);
    setState(ViewState.Retrieved);
    if (registrationResponse != null) {
      textState.value = true;
      Get.back();
      Fluttertoast.showToast(
          msg: 'User registered successfully!',
          backgroundColor: Colors.blue[400],
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP);
    }
  }

  void deleteImage() {
    image = null;
    update();
  }

  @override
  void onClose() {
    usernameController.clear();
    passwordController.clear();
    nameController.clear();

    mobileController.clear();
    cityController.clear();
    streetAddressController.clear();
    super.onClose();
  }
}
