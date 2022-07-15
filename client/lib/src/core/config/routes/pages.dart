import 'package:betify_client/src/core/config/routes/routes.dart';
import 'package:betify_client/src/views/screens/home/home.dart';
import 'package:flutter/material.dart';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (_) => const Home());
    default:
      throw ("There is no such route.");
  }
}
