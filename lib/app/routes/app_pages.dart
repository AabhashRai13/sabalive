import 'package:get/get.dart';

import 'package:sabalive/app/modules/home/bindings/home_binding.dart';
import 'package:sabalive/app/modules/home/views/home_view.dart';
import 'package:sabalive/screens/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
  ];
}
