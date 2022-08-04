import '../../../core/common/data_state.dart';
import '../../../core/common/params/register_params.dart';
import '../../../core/common/use_case.dart';
import '../../models/users/user.dart';
import '../../repositories/auth_repository.dart';

class Register implements UseCase<DataState<User>, RegisterParams> {
  final AuthRepository service;

  Register(this.service);

  @override
  Future<DataState<User>> call({required RegisterParams params}) async {
    return await service.registerUser(params);
  }
}
