

import 'package:get/get.dart';
import 'package:sabalive/controllers/about_us_controller.dart';
import 'package:sabalive/controllers/blog_controller.dart';

class BlogBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(() => BlogController());
  }
}
class AboutUsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(() => AboutUsController());
  }
}