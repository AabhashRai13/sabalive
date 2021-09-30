import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app_properties.dart';
import 'injector/injector.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    runApp(
      GetMaterialApp(
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: Duration(seconds: 1),
        debugShowCheckedModeBanner: false,
        title: "Application",
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.white, secondaryHeaderColor: darkgreen),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  } catch (error, stacktrace) {
    print('$error & $stacktrace');
  }
}
