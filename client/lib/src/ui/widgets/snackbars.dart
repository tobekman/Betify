import 'package:flutter/material.dart';

import '../../core/config/theme/color_constants.dart';

class MySnackBars {

  static defaultSnackbar(String message) => SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 15,
            overflow: TextOverflow.clip
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: ColorConstants.appBar,
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
      );

}