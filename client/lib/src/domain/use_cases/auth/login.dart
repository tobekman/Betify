import '../../../core/common/data_state.dart';
import '../../../core/common/params/login_params.dart';
import '../../../core/common/use_case.dart';
import '../../models/users/user.dart';
import '../../repositories/auth_repository.dart';

class Login implements UseCase<DataState<User>, LoginParams> {
  final AuthRepository service;

  Login(this.service);

  @override
  Future<DataState<User>> call({required LoginParams params}) async {
    return await service.loginUser(params);
  }
}
