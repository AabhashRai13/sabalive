
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/screens/main/main_page.dart';

class StoreSelector extends StatefulWidget {
  StoreSelector({Key key}) : super(key: key);

  @override
  _StoreSelectorState createState() => _StoreSelectorState();
}

class _StoreSelectorState extends State<StoreSelector> {
  final List<String> storenames=[
    "Udaypur Masu Pasal",
    "Suman meat shop",
    "Dharan Pork shop"
  ];

  String storeid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/SabaLive.png"),
            Align(
              alignment: Alignment.center,
              child: Text("Choose Store",style: TextStyle(
                fontSize: 22,
                  fontWeight: FontWeight.bold,
              ),)
            ),
            SizedBox(height: 20,),
          DropDownFormField(
            hintText: "Stores",
            required: false,
            titleText: null,
            onChanged: (value){
            setState(() {
              storeid = value;
            });
            },
            value: storeid,
            dataSource: [
              {
                "display": "Udaypur Masu Pasal",
                "value": "Udaypur Masu Pasal",
              },
              {
                "display": "Suman meat shop",
                "value": "Suman meat shop",
              }, {
                "display": "Dharan Pork shop",
                "value": "Dharan Pork shop",
              },
            ],
            textField: 'display',
            valueField: 'value',
          ),
              SizedBox(height: 40,),
              Center(
                child: InkWell(
                  onTap: (){
                    Get.to(MainPage());
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.teal[700],
                      borderRadius: BorderRadius.circular(9.0)
                    ),
                    
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
          )
        ),
      ),
    ),
    );
  }
}
