import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  final Color color;
  const MyCircularProgressIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
