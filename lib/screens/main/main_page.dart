import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_views/bottom_appbar_container.dart';
import 'package:sabalive/screens/main/components/homepage/homepage.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';
import 'package:sabalive/screens/profile_page.dart';
import 'package:sabalive/screens/shop/cart_page_view.dart';
import '../../app_properties.dart';
import '../../custom_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
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
    List<Widget> _screens = [
      HomePage(
        tabBar: tabBar,
        tabController: bottomTabController,
      ),
      // CategoryListPage(),
      CartPageView(),
      ProfilePage(),
    ];

    return Scaffold(
      drawer: drawer(context),
      bottomNavigationBar: BottomAppBarContainer(
        controller: bottomTabController,
      ),
      body: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: _screens),
    );
  }
}
