import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/config/routes/pages.dart' as routes;
import 'src/core/config/routes/routes.dart';
import 'src/core/config/theme/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('userBox');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betify',
      onGenerateRoute: routes.controller,
      initialRoute: box.isEmpty ? Routes.loginView : Routes.startingView,
      theme: MyTheme.theme,
    );
  }
}
