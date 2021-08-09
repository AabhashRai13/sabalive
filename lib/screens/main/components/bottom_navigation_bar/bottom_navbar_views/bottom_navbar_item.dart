import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navigationbar_controller/bottom_navbar_controller.dart';

class MyBottomNavigationBarItem extends GetView<BottomNavBarController> {
  final BottomNavBarController controller;
  final int currentScreenIndex;
  final IconData icon;
  final String label;
  final TabController tabController;
  const MyBottomNavigationBarItem(
      {Key key,
       @required this.controller,
        @required this.currentScreenIndex,
        @required this.icon,
        @required this.label,
        @required this.tabController,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      MaterialButton(
        minWidth: 30,
          onPressed: (){
          tabController.animateTo(currentScreenIndex);
            controller.currentIndex = currentScreenIndex;
          },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26.0,
              color: controller.currentIndex == currentScreenIndex ? Colors.teal[800]: Colors.grey,
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.0,
                color: controller.currentIndex == currentScreenIndex
                    ? Colors.teal[800]
                    : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

