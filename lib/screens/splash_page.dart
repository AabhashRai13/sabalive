import 'package:flutter/material.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/screens/main/main_page.dart';
import 'package:sabalive/screens/store_selector.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

import '../app_properties.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;
  bool _isviewed;
  
  choosestore() async{
    final SharedPreferencesManager sharedPreferencesManager =
    locator<SharedPreferencesManager>();
    _isviewed = SharedPreferencesManager().getBool("choosestore");
  if(_isviewed==null){
    await sharedPreferencesManager.putBool(
        SharedPreferencesManager.choosestore, true);
  }
  return _isviewed;
  }
  @override
  Future<void> initState(){
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
    choosestore();
    print(_isviewed);
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => _isviewed == true?MainPage() :StoreSelector()));
  }
  
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: lightgreen),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.asset('assets/SabaLive.png')),
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
