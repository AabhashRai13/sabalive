import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/screens/main/main_page.dart';

import 'main/widgets/stores_dropdown.dart';

class StoreSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.off(() => MainPage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.teal[700],
                            borderRadius: BorderRadius.circular(9.0)),
                        child: new Text("Let's go",
                            style: const TextStyle(
                                color: const Color(0xfffefefe),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0)),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
