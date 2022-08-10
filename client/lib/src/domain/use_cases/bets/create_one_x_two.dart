import '../../../core/common/data_state.dart';
import '../../../core/common/enums/request_status.dart';
import '../../../core/common/use_case.dart';
import '../../models/bets/oneXTwo.dart';
import '../../repositories/bets/one_x_two_repository.dart';

class CreateOneXTwo implements UseCase<DataState<RequestStatus>, OneXTwo> {
  final OneXTwoRepository service;

  CreateOneXTwo(this.service);

  @override
  Future<DataState<RequestStatus>> call({required OneXTwo params}) async {
    return service.createOneXTwo(params);
  }
}
