import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/controllers/contact_us_controller.dart';
import 'package:sabalive/screens/about_us/widgets/contact_us_textfield.dart';


class ContactUs extends StatelessWidget {
  ContactUs({Key key}) : super(key: key);
  final ContactUsController contactUsController= Get.put(ContactUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Contact Us",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Leave us a message, We will get contact with you as soon as possible.",
                style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              ContactUsTextField(hinttext: "Name",controller: contactUsController.nameController,),
              ContactUsTextField(hinttext: "Email",controller: contactUsController.emailController,),
              ContactUsTextField(hinttext: "Subject",controller: contactUsController.subjectController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField(
                    maxLines: null,
                    minLines: null,
                    controller: contactUsController.contentController,
                    decoration: InputDecoration(
                        hintText: "Your Message",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                  ),
                ),
              ),
  
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                contactUsController.mapContactInputs();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 80,
                  child: Center(
                      child: new Text("Send",
                          style: const TextStyle(
                              color: const Color(0xfffefefe),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0))),
                  decoration: BoxDecoration(
                      color: Colors.teal[600],
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 5),
                          blurRadius: 10.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(9.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
