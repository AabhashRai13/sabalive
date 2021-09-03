import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      iconTheme: IconThemeData(color: Colors.black),
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
