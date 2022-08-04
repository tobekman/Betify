import 'package:hive_flutter/hive_flutter.dart';

import '../../../register_services.dart';
import '../../core/common/data_state.dart';
import '../../core/common/params/login_params.dart';
import '../../core/common/params/register_params.dart';
import '../../domain/models/users/storage/logged_in_user.dart';
import '../../domain/models/users/user.dart';
import '../../domain/use_cases/auth/login.dart';
import '../../domain/use_cases/auth/register.dart';

class AuthController {
  Future<DataState<User>> login(LoginParams params) async {
    final response = await getIt<Login>().call(
      params: LoginParams(email: params.email, password: params.password),
    );
    if (response is DataSuccess) {
      Hive.box('userBox').add(LoggedInUser.fromUser(response.data!));
    }
    return response;
  }

  Future<DataState<User>> register(RegisterParams params) async {
    final response = await getIt<Register>().call(
      params: RegisterParams(
        displayName: params.displayName,
        username: params.username,
        email: params.email,
        password: params.password,
      ),
    );
    return response;
  }

  void logout() {
    var box = Hive.box('userBox');
    box.clear();
  }
}
