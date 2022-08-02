// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppConfig {
  final String baseApiUrl;
  AppConfig({
    required this.baseApiUrl,
  });
  

  AppConfig copyWith({
    String? baseApiUrl,
  }) {
    return AppConfig(
      baseApiUrl: baseApiUrl ?? this.baseApiUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseApiUrl': baseApiUrl,
    };
  }

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
      baseApiUrl: map['baseApiUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) => AppConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  
}
