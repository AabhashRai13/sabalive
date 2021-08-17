import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_views/bottom_navbar_item.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navigationbar_controller/bottom_navbar_controller.dart';

class BottomAppBarContainer extends StatelessWidget {
final BottomNavBarController _bottomNavBarController= Get.put(BottomNavBarController());
final TabController controller;

  BottomAppBarContainer({Key key,
    @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return BottomAppBar(
      child: Container(
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyBottomNavigationBarItem(
                controller: _bottomNavBarController,
                tabController: controller,
                currentScreenIndex: 0,
                icon: Icons.home,
                label: "Home"),
            MyBottomNavigationBarItem(
              tabController: controller,
                controller: _bottomNavBarController,
                currentScreenIndex: 1,
                icon: Icons.list_alt_sharp,
                label: "Category"),
            MyBottomNavigationBarItem(
              tabController: controller,
                controller: _bottomNavBarController,
                currentScreenIndex: 2,
                icon: Icons.shopping_cart,
                label: "Cart"),
            MyBottomNavigationBarItem(
              tabController: controller,
                controller: _bottomNavBarController,
                currentScreenIndex: 3,
                icon: Icons.local_offer,
                label: "Offers"),
          ],
        ),
      ),
    );
  }
}
