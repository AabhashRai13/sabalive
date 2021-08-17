import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
       
        title: Text("Special Offers",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
            
            ],
          ),
        ),
      ),
    );
  }
}
