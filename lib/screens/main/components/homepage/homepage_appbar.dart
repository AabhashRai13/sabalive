import 'package:flutter/material.dart';
import 'package:sabalive/screens/main/widgets/drawer.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leading: IconButton(
          onPressed: (){
            drawer();
          },
          icon: Icon(Icons.menu,color: Colors.black,)
      ),
      titleSpacing: 0.0,
      title: Text("HomePage"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.search,color: Colors.black,))
      ],
    );
  }
}
