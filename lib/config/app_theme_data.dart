import 'package:flutter/material.dart';

import '../app_constants/global_variables.dart';

class AppThemeData {
  static ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Lato',
    scaffoldBackgroundColor: colors.white,
    primaryColor: colors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      surface: Colors.white,
    ),
    useMaterial3: true,
  );
}
