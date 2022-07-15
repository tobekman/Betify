import 'package:betify_client/src/core/config/theme/color_constants.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData theme = ThemeData(
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: ColorConstants.primaryText,
      ),
      bodyText2: TextStyle(
        color: ColorConstants.primaryText,
      ),
      
    ),
    scaffoldBackgroundColor: ColorConstants.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.appBar,
      titleTextStyle: TextStyle(
        color: ColorConstants.primaryText,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorConstants.appBar,
        selectedItemColor: ColorConstants.primaryText,
        unselectedItemColor: ColorConstants.secondaryText,
        elevation: 0,
        type: BottomNavigationBarType.fixed),
  );
}
