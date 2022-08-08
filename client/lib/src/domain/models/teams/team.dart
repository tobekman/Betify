// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Team {
  final String name;
  final String league;
  final String country;
  Team({
    required this.name,
    required this.league,
    required this.country,
  });

  

  Team copyWith({
    String? name,
    String? league,
    String? country,
  }) {
    return Team(
      name: name ?? this.name,
      league: league ?? this.league,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'league': league,
      'country': country,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'] as String,
      league: map['league'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Team(name: $name, league: $league, country: $country)';

  @override
  bool operator ==(covariant Team other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.league == league &&
      other.country == country;
  }

  @override
  int get hashCode => name.hashCode ^ league.hashCode ^ country.hashCode;
}
