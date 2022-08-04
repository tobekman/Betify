import 'package:http/http.dart' as http;

import '../../../../register_services.dart';
import '../../../core/common/app_exception.dart';
import '../../../core/common/data_state.dart';
import '../../../core/common/error_response.dart';
import '../../../core/common/params/login_params.dart';
import '../../../core/common/params/register_params.dart';
import '../../../domain/models/config/app_config.dart';
import '../../../domain/models/users/user.dart';
import '../../../domain/repositories/auth_repository.dart';

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
      final user = _returnResponse(response);
      return DataSuccess(user);
    } on Exception catch (e) {
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
          throw UnauthorisedException(
              error, 'Please check your email and password');
        }
    }
  }
}
