import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/theme/color_constants.dart';
import '../../controllers/bets_controller.dart';
import '../../widgets/my_circular_progress_indicator.dart';
import 'widgets/create_bet_form.dart';
import 'widgets/one_x_two_card.dart';

class BetsScreen extends ConsumerWidget {
  const BetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final betsLoading = ref.watch(betsLoadingProvider);
    final bets = ref.watch(betsProvider);

    return Scaffold(
      body: betsLoading
          ? const Center(
              child: MyCircularProgressIndicator(
              color: ColorConstants.primary,
            ))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: bets.length,
              itemBuilder: (context, index) {
                return OneXTwoCard(bet: bets[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CreateBetForm(),
            ),
          );
        },
        backgroundColor: ColorConstants.primary,
        child: const Icon(
          Icons.playlist_add_sharp,
        ),
      ),
    );
  }
}
