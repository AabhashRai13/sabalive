import 'package:flutter/material.dart';
import 'package:sabalive/app_properties.dart';
import 'package:sabalive/utils/sizeConfig.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SliverAppBar(
      floating: true,
      backgroundColor: darkgreen,
      iconTheme: IconThemeData(color: Colors.white,size: SizeConfig.safeBlockHorizontal*7),
      titleSpacing: 0.0,
      title: Text("HomePage",style: TextStyle(color: Colors.white,
      fontSize: SizeConfig.safeBlockHorizontal*6
      ),),
      centerTitle: true,
     
    );
  }
}
