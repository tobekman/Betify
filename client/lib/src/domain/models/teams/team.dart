import 'dart:convert';

class Team {
  final String Name;
  final String League;
  final String Country;
  Team({
    required this.Name,
    required this.League,
    required this.Country,
  });

  Team copyWith({
    String? Name,
    String? League,
    String? Country,
  }) {
    return Team(
      Name: Name ?? this.Name,
      League: League ?? this.League,
      Country: Country ?? this.Country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': Name,
      'League': League,
      'Country': Country,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      Name: map['Name'] as String,
      League: map['League'] as String,
      Country: map['Country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Team(Name: $Name, League: $League, Country: $Country)';

  @override
  bool operator ==(covariant Team other) {
    if (identical(this, other)) return true;
  
    return 
      other.Name == Name &&
      other.League == League &&
      other.Country == Country;
  }

  @override
  int get hashCode => Name.hashCode ^ League.hashCode ^ Country.hashCode;
}