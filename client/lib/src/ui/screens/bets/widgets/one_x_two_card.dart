import 'package:betify_client/src/core/config/theme/my_theme.dart';
import 'package:betify_client/src/domain/models/bets/oneXTwo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneXTwoCard extends StatelessWidget {
  final OneXTwo bet;

  const OneXTwoCard({
    Key? key,
    required this.bet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DateTime date = b

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${bet.homeTeam.name} - ${bet.awayTeam.name}'),
        Text('${bet.homeTeam.country} / ${bet.homeTeam.league}'),
        Text('${bet.date}'),
      ],
    );
  }
}
