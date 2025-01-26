import 'package:flutter/material.dart';

class ThemeModel {
  // This is the theme class where all the theme colors are defined.
  ThemeModel(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.black,
      required this.white,
      required this.borderColor,
      required this.red,
      required this.textColor1,
      required this.offBlack,
      required this.gray,
      required this.gray2,
      required this.blueGreen,
      required this.black2});

  final Color primaryColor;
  final Color secondaryColor;
  final Color white;
  final Color black;
  final Color borderColor;
  final Color red;
  final Color textColor1;
  final Color offBlack;
  final Color gray;
  final Color gray2;
  final Color blueGreen;
  final Color black2;
}
