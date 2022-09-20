import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../register_services.dart';
import '../../core/common/enums/request_status.dart';
import '../../core/config/routes/routes.dart';
import '../controllers/auth_controller.dart';
import '../controllers/bets_controller.dart';
import '../widgets/snackbars.dart';
import 'bets/bets_view.dart';
import 'home/home_view.dart';
import 'profile/profile_view.dart';
import 'stats/stats_view.dart';
import 'upcoming/upcoming_view.dart';

class StartingView extends ConsumerStatefulWidget {
  const StartingView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartingScreenState();
}

class _StartingScreenState extends ConsumerState<StartingView> {
  int _currentIndex = 0;
  final List _screens = const [
    HomeView(),
    BetsView(),
    UpcomingView(),
    StatsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Betify'),
        actions: [
          IconButton(
            onPressed: () {
              locator<AuthController>().logout();
              Navigator.pushReplacementNamed(context, Routes.loginView);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Bets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _updateIndex(int value) async {
    setState(() {
      _currentIndex = value;
    });
    if (value == 0) {}
    if (value == 1) {
      final status = await ref.watch(betsProvider.notifier).loadBets();
      if (status == RequestStatus.fail) {
        ScaffoldMessenger.of(context).showSnackBar(MySnackBars.defaultSnackbar(
            'Unauthorized - Please relog your account'));
        locator<AuthController>().logout();
        Navigator.pushReplacementNamed(context, Routes.loginView);
      }
    }
  }
}
