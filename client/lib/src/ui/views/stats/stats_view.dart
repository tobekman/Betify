import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/theme/color_constants.dart';
import '../../../core/config/theme/my_theme.dart';
import '../../controllers/bets_controller.dart';

class StatsView extends ConsumerWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final betsController = ref.watch(betsProvider.notifier);
    final winPercentage =
        '${betsController.getWinLossRatio().ceil().toString()}%';
    final wins = betsController.getAmountOfWins();
    final losses = betsController.getAmountOfLosses();
    final betsAmount = betsController.getAmountOfBets();
    final winLossAmount = betsController.getWinLossAmount();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.infinity,
            height: 150,
            color: ColorConstants.appBar,
            child: Column(
              children: [
                Text(
                  winLossAmount.toInt().toString(),
                  style: MyTheme.headerTextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Win percentage: ',
                      style: TextStyle(
                        color: ColorConstants.secondaryText,
                      ),
                    ),
                    Text(
                      winPercentage,
                      style: MyTheme.primaryTextStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total bets: ',
                      style: TextStyle(
                        color: ColorConstants.secondaryText,
                      ),
                    ),
                    Text(
                      betsAmount.toString(),
                      style: MyTheme.primaryTextStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total wins: ',
                      style: TextStyle(
                        color: ColorConstants.secondaryText,
                      ),
                    ),
                    Text(
                      wins.toString(),
                      style: MyTheme.primaryTextStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total losses: ',
                      style: TextStyle(
                        color: ColorConstants.secondaryText,
                      ),
                    ),
                    Text(
                      losses.toString(),
                      style: MyTheme.primaryTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
