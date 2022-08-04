import '../../core/common/data_state.dart';
import '../../core/common/params/login_params.dart';
import '../../core/common/params/register_params.dart';
import '../models/users/user.dart';

abstract class AuthRepository {
  Future<DataState<User>> loginUser(LoginParams params);
  Future<DataState<User>> registerUser(RegisterParams params);
}
