import 'package:betify_client/register_services.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}
