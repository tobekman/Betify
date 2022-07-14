import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Betify',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Betify'),
        ),
        body: const Text('Betify'),
      ),
    );
  }
}
