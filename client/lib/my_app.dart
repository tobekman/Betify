import 'package:betify_client/src/core/config/routes/routes.dart';
import 'package:betify_client/src/core/config/theme/my_theme.dart';
import 'package:flutter/material.dart';

import 'src/core/config/routes/pages.dart' as routes;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betify',
      onGenerateRoute: routes.controller,
      initialRoute: Routes.loginScreen,
      theme: MyTheme.theme,
    );
  }
}
