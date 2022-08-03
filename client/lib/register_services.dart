import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:betify_client/src/data/services/auth/auth_service.dart';
import 'package:betify_client/src/domain/models/config/app_config.dart';
import 'package:betify_client/src/domain/repositories/auth_repository.dart';
import 'package:betify_client/src/domain/use_cases/auth/login.dart';

final getIt = GetIt.instance;

Future<void> initServices() async {
  //Config
  final configFile = await rootBundle.loadString('assets/config/main.json');
  final configData = jsonDecode(configFile);
  getIt.registerLazySingleton<AppConfig>(
      () => AppConfig(baseApiUrl: configData['BASE_API_URL']));

  //Service
  getIt.registerLazySingleton<AuthRepository>(() => AuthService());

  //Use case
  getIt.registerLazySingleton<Login>(() => Login(getIt()));
}
