import 'package:get/get.dart';

import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_binding/bottom_navbar_binding.dart';
import 'package:sabalive/screens/main/main_page.dart';
import 'package:sabalive/screens/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
        name: _Paths.MAINPAGE,
        page: () => MainPage(),
        binding: BottomNavBarBinding()),
  ];
}
