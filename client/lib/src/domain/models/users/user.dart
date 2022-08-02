import 'dart:convert';

class User {
  final String displayName;
  final String token;
  final String username;
  User({
    required this.displayName,
    required this.token,
    required this.username,
  });

  User copyWith({
    String? displayName,
    String? token,
    String? username,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
      token: token ?? this.token,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'token': token,
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      displayName: map['displayName'] as String,
      token: map['token'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(displayName: $displayName, token: $token, username: $username)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.displayName == displayName &&
      other.token == token &&
      other.username == username;
  }

  @override
  int get hashCode => displayName.hashCode ^ token.hashCode ^ username.hashCode;
}