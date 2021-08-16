import 'package:flutter/material.dart';
import 'package:sabalive/screens/main/components/product_list.dart';
import 'package:sabalive/screens/main/components/tab_view.dart';
import 'package:sabalive/screens/main/main_page.dart';
import 'package:sabalive/screens/notifications_page.dart';
import 'package:sabalive/screens/search_page.dart';

class HomePage extends StatelessWidget {
 
  const HomePage({
    Key key,
    @required this.topHeader,
    @required this.tabBar,
    @required this.tabController,
  }) : super(key: key);
  
  final Widget topHeader;
  final Widget tabBar;
  final TabController tabController;
  
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: kToolbarHeight + MediaQuery.of(context).padding.top,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
                        icon: Icon(Icons.notifications)),
                    IconButton(
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => SearchPage())),
                        icon: Icon(Icons.search)
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: topHeader,
            ),
            SliverToBoxAdapter(
              child: ProductList(
                products: products,
              ),
            ),
            SliverToBoxAdapter(
              child: tabBar,
            )
          ];
        },
        body: TabView(
          tabController: tabController,
        ),
      ),
    );
  }
}
