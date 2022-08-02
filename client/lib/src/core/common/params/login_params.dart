// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParams.fromJson(String source) => LoginParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginParams(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
