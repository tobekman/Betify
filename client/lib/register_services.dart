import 'dart:convert';
import 'package:betify_client/src/views/controllers/auth_controller.dart';
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

  //Services
  getIt.registerLazySingleton<AuthRepository>(() => AuthService());

  //Use cases
  getIt.registerLazySingleton<Login>(() => Login(getIt()));

  //Controllers
  getIt.registerLazySingleton<AuthController>(() => AuthController());
}
