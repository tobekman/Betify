import 'package:betify_client/src/core/config/routes/routes.dart';
import 'package:betify_client/src/core/config/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/config/routes/pages.dart' as routes;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('userBox');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betify',
      onGenerateRoute: routes.controller,
      initialRoute: box.isEmpty ? Routes.loginScreen : Routes.startingScreen,
      theme: MyTheme.theme,
    );
  }
}
