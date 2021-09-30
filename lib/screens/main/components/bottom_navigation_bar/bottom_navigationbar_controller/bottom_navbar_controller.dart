import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  PageController pageController;
  var currentIndex = 0.obs;
  
  GlobalKey bottomNavigationKey = GlobalKey();
  
  var homeIcon = Icon(Icons.search_outlined).obs;
  setBottomBarIndex(index,Icon icon) {
    print(index);
    currentIndex.value = index;
    
    homeIcon.value = icon;
    update();
  }
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