import 'package:betify_client/register_services.dart';
import 'package:betify_client/src/domain/models/users/storage/logged_in_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await Hive.initFlutter();
  Hive.registerAdapter(LoggedInUserAdapter());
  await Hive.openBox('userBox');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
