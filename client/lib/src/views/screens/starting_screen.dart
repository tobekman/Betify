import 'package:flutter/material.dart';

import '../../../register_services.dart';
import '../../core/config/routes/routes.dart';
import '../controllers/auth_controller.dart';
import 'bets/bets_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';
import 'stats/stats_screen.dart';
import 'upcoming/upcoming_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  int _currentIndex = 0;
  final List _screens = const [
    HomeScreen(),
    BetsScreen(),
    UpcomingScreen(),
    StatsScreen(),
    ProfileScreen(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Betify'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<AuthController>().logout();
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
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
}
