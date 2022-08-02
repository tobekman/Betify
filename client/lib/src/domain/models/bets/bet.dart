import 'dart:convert';

class Bet {
  final String id;
  final String date;
  final int stake;
  final int odds;
  final int result;
  Bet({
    required this.id,
    required this.date,
    required this.stake,
    required this.odds,
    required this.result,
  });

  Bet copyWith({
    String? id,
    String? date,
    int? stake,
    int? odds,
    int? result,
  }) {
    return Bet(
      id: id ?? this.id,
      date: date ?? this.date,
      stake: stake ?? this.stake,
      odds: odds ?? this.odds,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'stake': stake,
      'odds': odds,
      'result': result,
    };
  }

  factory Bet.fromMap(Map<String, dynamic> map) {
    return Bet(
      id: map['id'] as String,
      date: map['date'] as String,
      stake: map['stake'].toInt() as int,
      odds: map['odds'].toInt() as int,
      result: map['result'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bet.fromJson(String source) => Bet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bet(id: $id, date: $date, stake: $stake, odds: $odds, result: $result)';
  }

  @override
  bool operator ==(covariant Bet other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.date == date &&
      other.stake == stake &&
      other.odds == odds &&
      other.result == result;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      date.hashCode ^
      stake.hashCode ^
      odds.hashCode ^
      result.hashCode;
  }
}