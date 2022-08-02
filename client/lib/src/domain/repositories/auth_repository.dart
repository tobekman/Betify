import 'package:betify_client/src/core/common/data_state.dart';
import 'package:betify_client/src/core/common/params/login_params.dart';
import 'package:betify_client/src/core/common/params/register_params.dart';
import 'package:betify_client/src/domain/models/users/user.dart';

abstract class AuthRepository {
  Future<DataState<User>> loginUser(LoginParams params);
  Future<DataState<User>> registerUser(RegisterParams params);
}
