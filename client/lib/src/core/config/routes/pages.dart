import 'package:flutter/material.dart';

import '../../../ui/screens/home/home_screen.dart';
import '../../../ui/screens/login/login_screen.dart';
import '../../../ui/screens/login/register/register_screen.dart';
import '../../../ui/screens/starting_screen.dart';
import 'routes.dart';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case Routes.registerScreen:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case Routes.startingScreen:
      return MaterialPageRoute(builder: (_) => StartingScreen());
    case Routes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      throw ("There is no such route.");
  }
}
