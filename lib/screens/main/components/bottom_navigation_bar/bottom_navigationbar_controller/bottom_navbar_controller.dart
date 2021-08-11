import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  PageController pageController;
  var _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  set currentIndex(index) => _currentIndex.value =index;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
  
  @override
  void onReady() {
    super.onReady();
  }
  
  @override
  void onClose() {
    
    pageController.dispose();
  }
}