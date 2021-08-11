import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'app_properties.dart';

class AuthBackground extends CustomPainter {
  AuthBackground({
    this.image,
  });
  
  ui.Image image;
  
  @override
  void paint(Canvas canvas, Size size) {
    if (image != null)
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height),
        Paint()..color = lightgreen);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainBackground extends CustomPainter {
  MainBackground();
  
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;
    canvas.drawRect(
        Rect.fromLTRB(0, 0, width, height), Paint()..color = Colors.white
    );
    //
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}