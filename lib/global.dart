import 'package:flutter/material.dart';

//Theme data
final Color primaryColor = Colors.red;
final Color secondaryColor = Colors.white;
final Color primaryTextColor = Colors.black;

final double titleFontSize = 24;

TextStyle setTextStyle(
    {color = Colors.white,
    double size = 14,
    //family = 'Montserrat',
    weight = FontWeight.normal}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: size,
    //fontFamily: family,
  );
}

class GlobalCache {
  GlobalCache._privateConstructor();
  static final GlobalCache instance = GlobalCache._privateConstructor();

  double fontSize = 14;
}
