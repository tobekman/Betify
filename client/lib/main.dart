import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app.dart';
import 'register_services.dart';
import 'src/domain/models/users/storage/logged_in_user.dart';

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
