import 'package:flutter/material.dart';

import '../../../core/config/theme/color_constants.dart';
import '../../../core/config/theme/my_theme.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitComplete;

  SplashScreen({
    Key? key,
    required this.onInitComplete,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) => widget.onInitComplete());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Betify',
      theme: MyTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sports,
                    color: ColorConstants.primaryText,
                    size: 100,
                  ),
                  Text(
                    'BETIFY',
                    style: MyTheme.headerTextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
