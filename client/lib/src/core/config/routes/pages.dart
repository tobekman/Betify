import 'package:betify_client/src/core/config/routes/routes.dart';
import 'package:betify_client/src/views/screens/home/home_screen.dart';
import 'package:betify_client/src/views/screens/login/login_screen.dart';
import 'package:betify_client/src/views/screens/starting_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case Routes.startingScreen:
      return MaterialPageRoute(builder: (_) => StartingScreen());
    case Routes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      throw ("There is no such route.");
  }
}
