import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theme/color_constants.dart';
import '../../../../domain/models/bets/oneXTwo.dart';

class OneXTwoCard extends StatelessWidget {
  final OneXTwo bet;

  const OneXTwoCard({
    Key? key,
    required this.bet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(bet.date);
    final formattedDateTime = dateTime.format('D, M j Y, H:i');

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
                      formattedDateTime,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getWinningTeam() {
    if (bet.homeTeamScore - bet.awayTeamScore > 0) {
      return bet.homeTeam.name;
    }
    if (bet.awayTeamScore - bet.homeTeamScore > 0) {
      return bet.awayTeam.name;
    }
    return 'Draw';
  }

  String _getBetPrediction() {
    if (bet.prediction == 0) {
      return '${bet.homeTeam.name} to win';
    }
    if (bet.prediction == 2) {
      return '${bet.awayTeam.name} to win';
    }
    return 'Draw';
  }

  Widget _winOrLoseText() {
    if (bet.result == 0) {
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
}
