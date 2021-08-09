import 'package:flutter/material.dart';

const Color darkgreen = Color.fromRGBO(62, 180, 137, 0.4);
const Color mediumgreen = Color.fromRGBO(62, 180, 137, 0.7);
const Color green = Color.fromRGBO(62, 180, 137, 0.5);
const Color lightgreen = Color.fromRGBO(62, 180, 137, 1);

const Color darkGrey = Color(0xff202020);
const Color mainButtonColor = Color.fromRGBO(0, 137, 123, 0.6);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}