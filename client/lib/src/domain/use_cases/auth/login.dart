import 'package:betify_client/src/core/common/data_state.dart';
import 'package:betify_client/src/core/common/params/login_params.dart';
import 'package:betify_client/src/core/common/use_case.dart';
import 'package:betify_client/src/domain/models/users/user.dart';
import 'package:betify_client/src/domain/repositories/auth_repository.dart';

class Login implements UseCase<DataState<User>, LoginParams> {
  final AuthRepository service;

  Login(this.service);

  @override
  Future<DataState<User>> call({required LoginParams params}) async {
    return await service.loginUser(params);
  }
}
