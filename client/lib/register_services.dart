import 'dart:convert';

import 'package:betify_client/src/data/services/bet/one_x_two_service.dart';
import 'package:betify_client/src/data/services/news/news_service.dart';
import 'package:betify_client/src/domain/repositories/bets/one_x_two_repository.dart';
import 'package:betify_client/src/domain/repositories/news/news_repository.dart';
import 'package:betify_client/src/domain/use_cases/auth/register.dart';
import 'package:betify_client/src/domain/use_cases/bets/create_one_x_two.dart';
import 'package:betify_client/src/domain/use_cases/bets/get_user_one_x_twos.dart';
import 'package:betify_client/src/domain/use_cases/news/get_news.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'src/data/services/auth/auth_service.dart';
import 'src/domain/models/config/app_config.dart';
import 'src/domain/repositories/auth_repository.dart';
import 'src/domain/use_cases/auth/login.dart';
import 'src/ui/controllers/auth_controller.dart';

final locator = GetIt.instance;

Future<void> initServices() async {
  //Config
  final configFile = await rootBundle.loadString('assets/config/main.json');
  final configData = jsonDecode(configFile);
  locator.registerLazySingleton<AppConfig>(
      () => AppConfig(baseApiUrl: configData['BASE_API_URL']));

  //Services
  locator.registerLazySingleton<AuthRepository>(() => AuthService());
  locator.registerLazySingleton<OneXTwoRepository>(() => OneXTwoService());
  locator.registerLazySingleton<NewsRepository>(() => NewsService());

  //Use cases
  locator.registerLazySingleton<Login>(() => Login(locator()));
  locator.registerLazySingleton<Register>(() => Register(locator()));
  locator
      .registerLazySingleton<GetUserOneXTwos>(() => GetUserOneXTwos(locator()));
  locator.registerLazySingleton<GetNews>(() => GetNews(locator()));
  locator.registerLazySingleton<CreateOneXTwo>(() => CreateOneXTwo(locator()));

  //Controllers
  locator.registerLazySingleton<AuthController>(() => AuthController());
}
