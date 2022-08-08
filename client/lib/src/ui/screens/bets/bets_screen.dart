import 'package:betify_client/src/ui/controllers/bets_controller.dart';
import 'package:betify_client/src/ui/screens/bets/widgets/one_x_two_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
