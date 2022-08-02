import 'dart:io';

import 'package:betify_client/register_services.dart';
import 'package:betify_client/src/core/common/app_exception.dart';
import 'package:betify_client/src/core/common/error_response.dart';
import 'package:betify_client/src/domain/models/config/app_config.dart';
import 'package:http/http.dart' as http;

import 'package:betify_client/src/domain/models/users/user.dart';
import 'package:betify_client/src/core/common/params/register_params.dart';
import 'package:betify_client/src/core/common/params/login_params.dart';
import 'package:betify_client/src/core/common/data_state.dart';
import 'package:betify_client/src/domain/repositories/auth_repository.dart';

class AuthService implements AuthRepository {
  @override
  Future<DataState<User>> loginUser(LoginParams params) async {
    var url = Uri.parse('${getIt<AppConfig>().baseApiUrl}/api/account/login');
    var body = LoginParams(
      email: params.email,
      password: params.password,
    ).toJson();
    try {
      var response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      final user = _returnResponse(response);
      return DataSuccess(user);
    } on Exception catch (e) {
      print(e);
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<User>> registerUser(RegisterParams params) async {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return User.fromJson(response.body);
      case 401:
        {
          final error = ErrorResponse.fromJson(response.body);
          throw UnauthorisedException(error);
        }
    }
  }
}
