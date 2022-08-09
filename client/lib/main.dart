import 'package:betify_client/src/ui/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app.dart';
import 'register_services.dart';
import 'src/domain/models/users/storage/logged_in_user.dart';
import 'src/ui/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await Hive.initFlutter();
  Hive.registerAdapter(LoggedInUserAdapter());
  await Hive.openBox('userBox');
  final container = ProviderContainer();
  container.read(newsProvider.notifier).loadNews();
  runApp(
    SplashScreen(
      onInitComplete: () => runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}
