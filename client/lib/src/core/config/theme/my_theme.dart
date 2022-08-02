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
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: myFormBorder(),
      enabledBorder: myFormBorder(),
      labelStyle: const TextStyle(color: ColorConstants.primaryText),
      border: const OutlineInputBorder(),
      errorBorder: myErrorFormBorder(),
      focusedErrorBorder: myErrorFormBorder(),
      errorStyle: const TextStyle(overflow: TextOverflow.clip),
    ),
  );

  static TextStyle primaryTextStyle() {
    return const TextStyle(
      color: ColorConstants.primaryText,
      fontFamily: 'NotoSans'
    );
  }

  static TextStyle headerTextStyle() {
    return const TextStyle(
        color: ColorConstants.primaryText,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        fontFamily: 'NexaDemo');
  }

  static OutlineInputBorder myFormBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: ColorConstants.secondaryText,
      ),
    );
  }

  static OutlineInputBorder myErrorFormBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }
}
