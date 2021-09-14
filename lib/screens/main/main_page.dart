import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sabalive/models/product.dart';
import 'package:sabalive/screens/main/components/bottom_navigation_bar/bottom_navbar_views/bottom_appbar_container.dart';
import 'package:sabalive/screens/main/components/homepage/homepage.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';
import 'package:sabalive/screens/profile_page.dart';
import 'package:sabalive/screens/shop/check_out_page.dart';
import '../../app_properties.dart';
import '../../custom_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<Product> products = [
  Product(
      'assets/whitechicken.png',
      'Chicken',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      102.99),
  Product(
      'assets/fish.png',
      'Fish',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      55.99),
  Product(
      'assets/buff.png',
      'Buffalo Red Meat',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elitw, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      152.99),
];

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
      CheckOutPage(),
      ProfilePage(),
    ];

    return Scaffold(
      drawer: drawer(context),
      bottomNavigationBar: BottomAppBarContainer(
        controller: bottomTabController,
      ),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
            controller: bottomTabController,
            physics: NeverScrollableScrollPhysics(),
            children: _screens),
      ),
    );
  }
}
