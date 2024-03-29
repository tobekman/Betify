import 'package:betify_client/register_services.dart';
import 'package:betify_client/src/core/common/data_state.dart';
import 'package:betify_client/src/core/common/enums/request_status.dart';
import 'package:betify_client/src/core/common/params/get_bets_params.dart';
import 'package:betify_client/src/domain/use_cases/bets/create_one_x_two.dart';
import 'package:betify_client/src/domain/use_cases/bets/get_user_one_x_twos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/bets/oneXTwo.dart';

final betsProvider = StateNotifierProvider<BetsController, List<OneXTwo>>(
    (ref) => BetsController(
        locator<GetUserOneXTwos>(), locator<CreateOneXTwo>(), ref.read));

final betsLoadingProvider = StateProvider<bool>((ref) => false);

class BetsController extends StateNotifier<List<OneXTwo>> {
  final GetUserOneXTwos getUserOneXTwos;
  final CreateOneXTwo createOneXTwo;
  final Reader read;

  BetsController(this.getUserOneXTwos, this.createOneXTwo, this.read)
      : super([]);

  void addBet(OneXTwo bet) {
    state = [...state, bet];
  }

  Future<RequestStatus> loadBets() async {
    read(betsLoadingProvider.notifier).state = true;
    final bets = await getUserOneXTwos(
      params: GetBetsParams(
        pageSize: 10,
        pageNumber: 1,
      ),
    );
    if (bets is DataSuccess) {
      state = bets.data!;
      read(betsLoadingProvider.notifier).state = false;
      return RequestStatus.success;
    } else {
      read(betsLoadingProvider.notifier).state = false;
      return RequestStatus.fail;
    }
  }

  Future<RequestStatus> createBet(OneXTwo bet) async {
    final response = await createOneXTwo(params: bet);
    if (response is DataSuccess) {
      return RequestStatus.success;
    } else {
      return RequestStatus.fail;
    }
  }

  double getWinLossAmount() {
    double sum = 0;
    for (final OneXTwo bet in state) {
      if (bet.result == 0) {
        sum += bet.stake * bet.odds;
      } else {
        sum -= bet.stake;
      }
    }
    return sum;
  }

  int getAmountOfBets() {
    return state.length;
  }

  int getAmountOfWins() {
    int counter = 0;
    for (final OneXTwo bet in state) {
      if (bet.result == 0) {
        counter++;
      }
    }
    return counter;
  }

  int getAmountOfLosses() {
    int counter = 0;
    for (final OneXTwo bet in state) {
      if (bet.result == 1) {
        counter++;
      }
    }
    return counter;
  }

  double getWinLossRatio() {
    return getAmountOfWins() / getAmountOfBets() * 100;
  }
}
