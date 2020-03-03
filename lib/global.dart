import 'package:flutter/material.dart';

//Theme data
final Color primaryColor = Colors.red;
final Color secondaryColor = Colors.white;

final double titleFontSize = 24;

TextStyle setTextStyle(
    {color = Colors.white,
    double textScaleConstant = 0,
    //family = 'Montserrat',
    weight = FontWeight.normal}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: GlobalCache.instance.fontSize + textScaleConstant,
    //fontFamily: family,
  );
}

class GlobalCache {
  GlobalCache._privateConstructor();
  static final GlobalCache instance = GlobalCache._privateConstructor();
  
  double fontSize = 14;
}
