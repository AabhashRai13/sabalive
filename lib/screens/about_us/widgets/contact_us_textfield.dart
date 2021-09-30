import 'package:flutter/material.dart';


class ContactUsTextField extends StatelessWidget {
  const ContactUsTextField({
    Key key,
    @required this.hinttext, @required this.controller,@required this.validator,
  }) : super(key: key);
  
  final String hinttext;
  final TextEditingController controller;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hinttext,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
            )
        ),
        validator: validator
      ),
    );
  }
}
