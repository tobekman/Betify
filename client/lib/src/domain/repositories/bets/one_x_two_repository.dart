import '../../../core/common/data_state.dart';
import '../../../core/common/params/get_bets_params.dart';
import '../../models/bets/oneXTwo.dart';

abstract class OneXTwoRepository {
  Future<DataState<List<OneXTwo>>> getUserOneXTwos(GetBetsParams params);
}
