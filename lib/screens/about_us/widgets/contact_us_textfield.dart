import 'package:flutter/material.dart';


class ContactUsTextField extends StatelessWidget {
  const ContactUsTextField({
    Key key,
    @required this.hinttext,
  }) : super(key: key);
  
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hinttext,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
            )
        ),
      ),
    );
  }
}
