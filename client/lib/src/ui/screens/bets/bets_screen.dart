import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/bets_controller.dart';
import 'widgets/one_x_two_card.dart';

class BetsScreen extends ConsumerWidget {
  const BetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final betsLoading = ref.watch(betsLoadingProvider);
    final bets = ref.watch(betsProvider);

    return Center(
      child: betsLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              shrinkWrap: true,
              itemCount: bets.length,
              itemBuilder: (context, index) {
                return OneXTwoCard(bet: bets[index]);
              },
            ),
    );
  }
}
