import 'package:flutter/material.dart';

import 'main/widgets/stores_dropdown.dart';

class StoreSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: height/10,),
                    Image.asset("assets/SabaLive.png"),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Choose Store",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    StoresDropDown(),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
