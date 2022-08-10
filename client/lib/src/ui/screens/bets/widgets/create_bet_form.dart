import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/enums/request_status.dart';
import '../../../../core/config/theme/color_constants.dart';
import '../../../../core/config/theme/my_theme.dart';
import '../../../../domain/models/bets/oneXTwo.dart';
import '../../../../domain/models/teams/team.dart';
import '../../../controllers/bets_controller.dart';
import '../../../widgets/snackbars.dart';

class CreateBetForm extends ConsumerStatefulWidget {
  const CreateBetForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateBetFormState();
}

class _CreateBetFormState extends ConsumerState<CreateBetForm> {
  final _formKey = GlobalKey<FormState>();
  final homeTeam = TextEditingController();
  final awayTeam = TextEditingController();
  final homeTeamScore = TextEditingController();
  final awayTeamScore = TextEditingController();
  final stake = TextEditingController();
  final odds = TextEditingController();

  int predictionValue = 0;
  int betResultValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.background,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Create a bet',
              style: MyTheme.headerTextStyle(),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _displayHomeTeamFormField(),
                  const SizedBox(height: 10),
                  _displayAwayTeamFormField(),
                  const SizedBox(height: 10),
                  _displayHomeTeamScoreFormField(),
                  const SizedBox(height: 10),
                  _displayAwayTeamScoreFormField(),
                  const SizedBox(height: 10),
                  _displayStakeFormField(),
                  const SizedBox(height: 10),
                  _displayOddsFormField(),
                  const SizedBox(height: 10),
                  _displayDropdownInputsRow(),
                  const SizedBox(height: 10),
                  _displayCreateButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayHomeTeamFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: homeTeam,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Home team',
          ),
          style: MyTheme.primaryTextStyle(),
        ),
      );

  Widget _displayAwayTeamFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: awayTeam,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Away team',
          ),
          style: MyTheme.primaryTextStyle(),
        ),
      );

  Widget _displayHomeTeamScoreFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: homeTeamScore,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Home team score',
          ),
          style: MyTheme.primaryTextStyle(),
        ),
      );

  Widget _displayAwayTeamScoreFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: awayTeamScore,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Away team score',
          ),
          style: MyTheme.primaryTextStyle(),
        ),
      );

  Widget _displayStakeFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: stake,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Stake',
          ),
          style: MyTheme.primaryTextStyle(),
        ),
      );

  Widget _displayOddsFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          controller: odds,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Odds',
          ),
          style: MyTheme.primaryTextStyle(),
        ),
      );

  Widget _displayDropdownInputsRow() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prediction: ',
                  style: MyTheme.primaryTextStyle(),
                ),
                _displayPredictionDropdown(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Result: ',
                  style: MyTheme.primaryTextStyle(),
                ),
                _displayResultDropdown(),
              ],
            ),
          ],
        ),
      );

  Widget _displayPredictionDropdown() => DecoratedBox(
        decoration: BoxDecoration(
          color: ColorConstants.appBar, //background color of dropdown button
          //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: SizedBox(
          width: 55,
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: DropdownButton(
                dropdownColor: ColorConstants.appBar,
                style: MyTheme.primaryTextStyle(),
                items: predictionItems,
                value: predictionValue,
                onChanged: (value) {
                  setState(() {
                    predictionValue = value as int;
                  });
                },
              ),
            ),
          ),
        ),
      );

  List<DropdownMenuItem<int>> get predictionItems {
    List<DropdownMenuItem<int>> menuItems = const [
      DropdownMenuItem(value: 0, child: Text("1")),
      DropdownMenuItem(value: 1, child: Text("X")),
      DropdownMenuItem(value: 2, child: Text("2")),
    ];
    return menuItems;
  }

  Widget _displayResultDropdown() => DecoratedBox(
        decoration: BoxDecoration(
          color: ColorConstants.appBar, //background color of dropdown button
          //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: SizedBox(
          width: 67,
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: DropdownButton(
                dropdownColor: ColorConstants.appBar,
                style: MyTheme.primaryTextStyle(),
                items: resultItems,
                value: betResultValue,
                onChanged: (value) {
                  setState(() {
                    betResultValue = value as int;
                  });
                },
              ),
            ),
          ),
        ),
      );

  List<DropdownMenuItem<int>> get resultItems {
    List<DropdownMenuItem<int>> menuItems = const [
      DropdownMenuItem(value: 0, child: Text("Win")),
      DropdownMenuItem(value: 1, child: Text("Loss")),
    ];
    return menuItems;
  }

  Widget _displayCreateButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 60)),
            backgroundColor: MaterialStateProperty.all<Color>(
              ColorConstants.primary,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              MyTheme.buttonTextStyle(),
            ),
          ),
          onPressed: () {
            _formKey.currentState!.save();
            _createBet();
          },
          child: const Text(
            'Create bet',
          ),
        ),
      );

  void _createBet() async {
    final bet = OneXTwo(
      date: DateTime.now().toString(),
      stake: double.parse(stake.text),
      odds: double.parse(odds.text),
      result: betResultValue,
      betType: 1,
      homeTeam: Team(
          name: homeTeam.text, league: 'Premier League', country: 'England'),
      awayTeam: Team(
          name: awayTeam.text, league: 'Premier League', country: 'England'),
      prediction: predictionValue,
      homeTeamScore: int.parse(homeTeamScore.text),
      awayTeamScore: int.parse(awayTeamScore.text),
    );
    final response = await ref.watch(betsProvider.notifier).createBet(bet);

    ref.watch(betsProvider.notifier).addBet(bet);

    if (response == RequestStatus.success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBars.defaultSnackbar('Bet Created'));
      Navigator.pop(context);
    }

    if (response == RequestStatus.fail) {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackBars.defaultSnackbar('Problems creating bet, try again'));
      Navigator.pop(context);
    }
  }
}
