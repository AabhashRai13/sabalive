import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField({
    Key key,
    @required this.icon,
    @required this.validator,
    @required this.hintText,
    @required this.obscureText,
    @required this.controller,
    
  }) :
        super(key: key);
  
  final TextEditingController controller;
  final Icon icon;
  final Function validator;
  final String hintText;
  final bool obscureText;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hintText
        ),
        validator: validator,
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        obscureText: obscureText,
      ),
    );
  }
}
