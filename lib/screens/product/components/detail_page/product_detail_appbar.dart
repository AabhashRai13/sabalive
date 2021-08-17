import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_properties.dart';
class ProductDetailAppbar extends StatelessWidget {
  const ProductDetailAppbar({
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
          ),
          child: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(CupertinoIcons.back)),
        ),
      ),
      iconTheme: IconThemeData(color: darkGrey),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Row(
              children: [
                Text("4.5",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5,),
                Icon(Icons.star,color: Colors.yellow,)
              ],
            ),
          ),
        )
      ],
    
    );
  }
}
