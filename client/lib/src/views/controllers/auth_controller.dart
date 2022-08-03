import 'package:betify_client/register_services.dart';
import 'package:betify_client/src/core/common/data_state.dart';
import 'package:betify_client/src/core/common/params/login_params.dart';
import 'package:betify_client/src/domain/models/users/storage/logged_in_user.dart';
import 'package:betify_client/src/domain/models/users/user.dart';
import 'package:betify_client/src/domain/use_cases/auth/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  void logout() {
    var box = Hive.box('userBox');
    box.clear();
  }
}
