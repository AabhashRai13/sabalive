import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/home_controller_controller.dart';
import 'package:sabalive/screens/main/components/homepage/category_carousel.dart';
import 'package:sabalive/screens/main/components/homepage/homepage_appbar.dart';
import 'package:sabalive/screens/main/components/homepage/hompage_invite_banner.dart';
import 'package:sabalive/screens/main/components/homepage/image_slider.dart';
import 'package:sabalive/screens/main/components/homepage/store_wise_product.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';
import 'package:sabalive/screens/main/widgets/store_select_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, @required this.tabBar, @required this.tabController})
      : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

 

  final Widget tabBar;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      body: CustomScrollView(
        slivers: [
          HomePageAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StoreSelectBottomSheet(
                      homeController: _homeController,
                    ),
                  ),
                  HomePageInviteBanner(),
                  // MeatCarousel(
                  //     title: "Meat",
                  //     subtitle: "Red and White meats",
                  //     productList: products),
                  CategoryCarousel(homeController: _homeController),
                  StoreWiseProduct(
                    homeController: _homeController,
                  ),
                  ImageSlider(homeController: _homeController,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
