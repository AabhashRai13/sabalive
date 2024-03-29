import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_views/bottom_appbar_container.dart';
import 'package:sabalive/screens/main/components/homepage/homepage.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';
import 'package:sabalive/screens/profile_page.dart';
import '../../app_properties.dart';
import 'components/bottom_navigation_bar/bottom_navigationbar_controller/bottom_navbar_controller.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  final BottomNavBarController bottomNavBarController =
  Get.put(BottomNavBarController());
  
  SwiperController swiperController;
  TabController tabController;
  TabController bottomTabController;
  
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 3, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'In Demand'),
        Tab(text: 'Red meat'),
        Tab(text: 'White meat'),
        Tab(text: 'Fish'),
        Tab(text: 'Sea food'),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );
    
    return Scaffold(
        drawer: drawer(context),
        bottomNavigationBar: BottomNavBar(),
        body: GetBuilder<BottomNavBarController>(
            init: BottomNavBarController(),
            builder: (data) {
              switch (data.currentIndex.value) {
                case 1:
                  return ProfilePage();
                default:
                  return HomePage(
                    tabBar: tabBar,
                    tabController: bottomTabController,
                  );
              }
            }));
  }
}