import 'package:flutter/material.dart';

class HomePageInviteBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 150.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        
      ),
      child: Image.asset(
        'assets/inviteBox.png',
        fit: BoxFit.fill,
      ),
      
    );
  }
}
