// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:betify_client/src/domain/models/users/user.dart';

part 'logged_in_user.g.dart';

@HiveType(typeId: 0)
class LoggedInUser extends HiveObject {

  @HiveField(0)
  String displayName;
  @HiveField(1)
  String token;
  LoggedInUser({
    required this.displayName,
    required this.token,
  });



  factory LoggedInUser.fromUser(User user) {
    return LoggedInUser(
      displayName: user.displayName,
      token: user.token,
    );
  }


}
