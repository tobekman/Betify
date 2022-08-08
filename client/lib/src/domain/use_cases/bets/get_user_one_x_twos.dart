import '../../../core/common/data_state.dart';
import '../../../core/common/params/get_bets_params.dart';
import '../../../core/common/use_case.dart';
import '../../models/bets/oneXTwo.dart';
import '../../repositories/bets/one_x_two_repository.dart';

class GetUserOneXTwos
    implements UseCase<DataState<List<OneXTwo>>, GetBetsParams> {
  final OneXTwoRepository service;

  GetUserOneXTwos(this.service);

  @override
  Future<DataState<List<OneXTwo>>> call({required GetBetsParams params}) async {
    return await service.getUserOneXTwos(params);
  }
}
