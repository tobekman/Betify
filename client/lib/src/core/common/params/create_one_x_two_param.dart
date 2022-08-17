// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../domain/models/teams/team.dart';

class CreateOneXTwoParams {
  final num stake;
  final num odds;
  final int result;
  final int betType;
  final Team homeTeam;
  final Team awayTeam;
  final int oneXTwoPrediction;
  final int homeTeamScore;
  final int awayTeamScore;

  CreateOneXTwoParams({
    required this.stake,
    required this.odds,
    required this.result,
    required this.betType,
    required this.homeTeam,
    required this.awayTeam,
    required this.oneXTwoPrediction,
    required this.homeTeamScore,
    required this.awayTeamScore,
  });

  CreateOneXTwoParams copyWith({
    num? stake,
    num? odds,
    int? result,
    int? betType,
    Team? homeTeam,
    Team? awayTeam,
    int? oneXTwoPrediction,
    int? homeTeamScore,
    int? awayTeamScore,
  }) {
    return CreateOneXTwoParams(
      stake: stake ?? this.stake,
      odds: odds ?? this.odds,
      result: result ?? this.result,
      betType: betType ?? this.betType,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      oneXTwoPrediction: oneXTwoPrediction ?? this.oneXTwoPrediction,
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
      'oneXTwoPrediction': oneXTwoPrediction,
      'homeTeamScore': homeTeamScore,
      'awayTeamScore': awayTeamScore,
    };
  }

  factory CreateOneXTwoParams.fromMap(Map<String, dynamic> map) {
    return CreateOneXTwoParams(
      stake: map['stake'] as num,
      odds: map['odds'] as num,
      result: map['result'] as int,
      betType: map['betType'] as int,
      homeTeam: Team.fromMap(map['homeTeam'] as Map<String, dynamic>),
      awayTeam: Team.fromMap(map['awayTeam'] as Map<String, dynamic>),
      oneXTwoPrediction: map['oneXTwoPrediction'] as int,
      homeTeamScore: map['homeTeamScore'] as int,
      awayTeamScore: map['awayTeamScore'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateOneXTwoParams.fromJson(String source) =>
      CreateOneXTwoParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateOneXTwoParams(stake: $stake, odds: $odds, result: $result, betType: $betType, homeTeam: $homeTeam, awayTeam: $awayTeam, oneXTwoPrediction: $oneXTwoPrediction, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore)';
  }

  @override
  bool operator ==(covariant CreateOneXTwoParams other) {
    if (identical(this, other)) return true;

    return other.stake == stake &&
        other.odds == odds &&
        other.result == result &&
        other.betType == betType &&
        other.homeTeam == homeTeam &&
        other.awayTeam == awayTeam &&
        other.oneXTwoPrediction == oneXTwoPrediction &&
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
        oneXTwoPrediction.hashCode ^
        homeTeamScore.hashCode ^
        awayTeamScore.hashCode;
  }
}
