// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterParams {
  final String displayName;
  final String username;
  final String email;
  final String password;

  RegisterParams({
    required this.displayName,
    required this.username,
    required this.email,
    required this.password,
  });
  

  RegisterParams copyWith({
    String? displayName,
    String? username,
    String? email,
    String? password,
  }) {
    return RegisterParams(
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory RegisterParams.fromMap(Map<String, dynamic> map) {
    return RegisterParams(
      displayName: map['displayName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterParams.fromJson(String source) => RegisterParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterParams(displayName: $displayName, username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant RegisterParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.displayName == displayName &&
      other.username == username &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
      username.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
