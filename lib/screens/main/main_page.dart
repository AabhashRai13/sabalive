import 'package:flutter/material.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_views/bottom_appbar_container.dart';
import 'package:sabalive/screens/main/components/homepage/homepage.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';
import 'package:sabalive/screens/profile_page.dart';
import 'package:sabalive/screens/shop/cart_page_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    bottomTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomePage(
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