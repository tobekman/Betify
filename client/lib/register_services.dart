import 'dart:convert';

import 'package:betify_client/src/data/services/bet/one_x_two_service.dart';
import 'package:betify_client/src/domain/repositories/bets/one_x_two_repository.dart';
import 'package:betify_client/src/domain/use_cases/auth/register.dart';
import 'package:betify_client/src/domain/use_cases/bets/get_user_one_x_twos.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'src/data/services/auth/auth_service.dart';
import 'src/domain/models/config/app_config.dart';
import 'src/domain/repositories/auth_repository.dart';
import 'src/domain/use_cases/auth/login.dart';
import 'src/ui/controllers/auth_controller.dart';

final getIt = GetIt.instance;

Future<void> initServices() async {
  //Config
  final configFile = await rootBundle.loadString('assets/config/main.json');
  final configData = jsonDecode(configFile);
  getIt.registerLazySingleton<AppConfig>(
      () => AppConfig(baseApiUrl: configData['BASE_API_URL']));

  //Services
  getIt.registerLazySingleton<AuthRepository>(() => AuthService());
  getIt.registerLazySingleton<OneXTwoRepository>(() => OneXTwoService());

  //Use cases
  getIt.registerLazySingleton<Login>(() => Login(getIt()));
  getIt.registerLazySingleton<Register>(() => Register(getIt()));
  getIt.registerLazySingleton<GetUserOneXTwos>(() => GetUserOneXTwos(getIt()));

  //Controllers
  getIt.registerLazySingleton<AuthController>(() => AuthController());
}
