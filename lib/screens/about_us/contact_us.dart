import 'package:flutter/material.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us",style: TextStyle(color: Colors.black),),
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
