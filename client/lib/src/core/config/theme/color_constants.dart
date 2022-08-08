import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  static const background = Color(0xff000000);
  static const appBar = Color(0xff19191b);
  static const primaryText = Color(0xfffefefe);
  static const secondaryText = Color(0xff616163);
  static const primary = Color(0xff395B64);
  static const primaryLight = Color(0xffA5C9CA);
  static const primaryGradient = LinearGradient(
      colors: [
        Color(0xff79e4d8),
        Color(0xff71dde2),
        Color(0xff72d5e8),
        Color(0xff7bcdeb),
        Color(0xff88c3e9),
        Color(0xff96bae3),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 0.2, 0.5, 0.7, 0.9, 1]);
}
