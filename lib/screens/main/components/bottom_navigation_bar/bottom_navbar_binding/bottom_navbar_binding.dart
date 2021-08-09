import 'package:get/get.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navigationbar_controller/bottom_navbar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    // Get.lazyPut<BottomNavBarController>(
    //       () => BottomNavBarController(),
    // );
  }
}