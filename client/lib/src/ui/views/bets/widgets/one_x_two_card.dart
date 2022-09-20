import 'package:flutter/material.dart';

import '../../../../core/common/mixins/format_date_mixin.dart';
import '../../../../core/config/theme/color_constants.dart';
import '../../../../core/config/theme/my_theme.dart';
import '../../../../domain/models/bets/oneXTwo.dart';

class OneXTwoCard extends StatelessWidget with FormatDateMixin {
  final OneXTwo bet;

  const OneXTwoCard({
    Key? key,
    required this.bet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: ColorConstants.appBar,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatDate(bet.date),
                      style: const TextStyle(
                        color: ColorConstants.secondaryText,
                        fontSize: 11,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Stake: ',
                          style: TextStyle(
                            color: ColorConstants.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          bet.stake.toString(),
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Odds: ',
                          style: TextStyle(
                            color: ColorConstants.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          bet.odds.toString(),
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                    Text(_getBetPrediction()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('${bet.homeTeam.name} - ${bet.awayTeam.name}'),
                    Text(
                      '${bet.homeTeam.country} / ${bet.homeTeam.league}',
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Result: ',
                          style: TextStyle(
                            color: ColorConstants.secondaryText,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '${bet.homeTeamScore} - ${bet.awayTeamScore}',
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _winOrLoseText(),
                    Text(
                      _getWinAmount(),
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

  String _getWinAmount() {
    if (_betIsWin()) {
      return (bet.odds * bet.stake).toString();
    }
    return '';
  }

  String _getBetPrediction() {
    if (bet.oneXTwoPrediction == 0) {
      return '${bet.homeTeam.name} to win';
    }
    if (bet.oneXTwoPrediction == 2) {
      return '${bet.awayTeam.name} to win';
    }
    return 'Draw';
  }

  Widget _winOrLoseText() {
    if (_betIsWin()) {
      return const Text(
        'Win',
        style: TextStyle(
          color: Colors.green,
        ),
      );
    }
    return const Text(
      'Loss',
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  bool _betIsWin() {
    return bet.result == 0;
  }
}
