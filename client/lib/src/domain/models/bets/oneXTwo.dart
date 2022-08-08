import 'dart:convert';

import '../teams/team.dart';

class OneXTwo {
  final int stake;
  final int odds;
  final int result;
  final int betType;
  final Team homeTeam;
  final Team awayTeam;
  final int prediction;
  final int homeTeamScore;
  final int awayTeamScore;
  OneXTwo({
    required this.stake,
    required this.odds,
    required this.result,
    required this.betType,
    required this.homeTeam,
    required this.awayTeam,
    required this.prediction,
    required this.homeTeamScore,
    required this.awayTeamScore,
  });

  OneXTwo copyWith({
    int? stake,
    int? odds,
    int? result,
    int? betType,
    Team? homeTeam,
    Team? awayTeam,
    int? prediction,
    int? homeTeamScore,
    int? awayTeamScore,
  }) {
    return OneXTwo(
      stake: stake ?? this.stake,
      odds: odds ?? this.odds,
      result: result ?? this.result,
      betType: betType ?? this.betType,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      prediction: prediction ?? this.prediction,
      homeTeamScore: homeTeamScore ?? this.homeTeamScore,
      awayTeamScore: awayTeamScore ?? this.awayTeamScore,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stake': stake,
      'odds': odds,
      'result': result,
      'betType': betType,
      'homeTeam': homeTeam.toMap(),
      'awayTeam': awayTeam.toMap(),
      'prediction': prediction,
      'homeTeamScore': homeTeamScore,
      'awayTeamScore': awayTeamScore,
    };
  }

  factory OneXTwo.fromMap(Map<String, dynamic> map) {
    return OneXTwo(
      stake: map['stake'].toInt() as int,
      odds: map['odds'].toInt() as int,
      result: map['result'].toInt() as int,
      betType: map['betType'].toInt() as int,
      homeTeam: Team.fromMap(map['homeTeam'] as Map<String,dynamic>),
      awayTeam: Team.fromMap(map['awayTeam'] as Map<String,dynamic>),
      prediction: map['prediction'].toInt() as int,
      homeTeamScore: map['homeTeamScore'].toInt() as int,
      awayTeamScore: map['awayTeamScore'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OneXTwo.fromJson(String source) => OneXTwo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OneXTwo(stake: $stake, odds: $odds, result: $result, betType: $betType, homeTeam: $homeTeam, awayTeam: $awayTeam, prediction: $prediction, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore)';
  }

  @override
  bool operator ==(covariant OneXTwo other) {
    if (identical(this, other)) return true;
  
    return 
      other.stake == stake &&
      other.odds == odds &&
      other.result == result &&
      other.betType == betType &&
      other.homeTeam == homeTeam &&
      other.awayTeam == awayTeam &&
      other.prediction == prediction &&
      other.homeTeamScore == homeTeamScore &&
      other.awayTeamScore == awayTeamScore;
  }

  @override
  int get hashCode {
    return stake.hashCode ^
      odds.hashCode ^
      result.hashCode ^
      betType.hashCode ^
      homeTeam.hashCode ^
      awayTeam.hashCode ^
      prediction.hashCode ^
      homeTeamScore.hashCode ^
      awayTeamScore.hashCode;
  }
}