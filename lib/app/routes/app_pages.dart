import 'package:get/get.dart';
import 'package:sabalive/screens/about_us/about_us.dart';
import 'package:sabalive/screens/intro_page.dart';

import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_binding/bottom_navbar_binding.dart';
import 'package:sabalive/screens/main/main_page.dart';
import 'package:sabalive/screens/product/product_detail_page.dart';
import 'package:sabalive/screens/special_offers/special_offers.dart';

import 'package:sabalive/screens/splash_page.dart';
import 'package:sabalive/screens/store_selector.dart';

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
    GetPage(
      name: _Paths.STORESELECTOR,
      page: () => StoreSelector(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => AboutUs(),
    ),
    GetPage(name: _Paths.SPECIALOFFERS, page: () => SpecialOffers()),
    GetPage(name: _Paths.PRODUCTPAGE, page: () => ProductPage()),
    GetPage(
      name: _Paths.INTROPAGE,
      page: () => IntroPage(),
    )
  ];
}
