import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle titleStyle({
    Color? color,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    required String fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle bodyStyle({
    Color? color,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle smallStyle({
    Color? color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }
}