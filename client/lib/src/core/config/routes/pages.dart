import 'package:flutter/material.dart';

import '../../../ui/views/home/home_view.dart';
import '../../../ui/views/login/login_view.dart';
import '../../../ui/views/login/register/register_screen.dart';
import '../../../ui/views/starting_view.dart';
import 'routes.dart';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginView:
      return MaterialPageRoute(builder: (_) => LoginView());
    case Routes.registerView:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case Routes.startingView:
      return MaterialPageRoute(builder: (_) => const StartingView());
    case Routes.homeView:
      return MaterialPageRoute(builder: (_) => const HomeView());
    default:
      throw ("There is no such route.");
  }
}
