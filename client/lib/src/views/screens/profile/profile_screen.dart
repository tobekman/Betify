import 'package:betify_client/src/domain/models/users/storage/logged_in_user.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('userBox');
    LoggedInUser user = box.get(0);

    return Center(
      child: Text("${user.displayName}'s Profile"),
    );
  }
}
