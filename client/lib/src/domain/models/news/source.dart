import 'dart:convert';

class Source {
  final String name;
  Source({
    required this.name,
  });

  Source copyWith({
    String? name,
  }) {
    return Source(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) =>
      Source.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Source(name: $name)';
}
